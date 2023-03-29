import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_test/common/exception.dart';
import 'package:online_exam_test/data/repo/authrepository.dart';
import 'package:online_exam_test/ui/auth/bloc/auth_bloc.dart';
import 'package:online_exam_test/ui/home/home.dart';
import 'package:online_exam_test/ui/root.dart';

class AuthScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final onBackground = Colors.white;
    return Theme(
      data: themeData.copyWith(
          snackBarTheme: SnackBarThemeData(
              backgroundColor: Colors.grey.shade600,
              contentTextStyle: TextStyle(
                fontFamily: 'IranYekan',
              )),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(
                    color: Color.fromARGB(158, 54, 54, 54),
                  )),
                  minimumSize: MaterialStateProperty.all(
                    const Size.fromHeight(56),
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                  backgroundColor: MaterialStateProperty.all(onBackground))),
          colorScheme: themeData.colorScheme.copyWith(
            onSurface: onBackground,
          ),
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                color: onBackground,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: onBackground),
              ))),
      child: Scaffold(
        backgroundColor: Color.fromARGB(158, 54, 54, 54),
        body: BlocProvider<AuthBloc>(
          create: (context) {
            final bloc = AuthBloc(authRepository);
            bloc.stream.forEach((state) {
              if (state is AuthSuccess) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RootScreen(
                    toggleThemeMode: () {},
                  ),
                ));
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.exception.message)));
              }
            });
            bloc.add(AuthStarted());
            return bloc;
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) {
                return current is AuthLoading ||
                    current is AuthInitial ||
                    current is AuthError;
              },
              builder: (context, state) {
                return Center(
                  child: Container(
                    width: 400,
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            color: onBackground,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Please enter to your account',
                          style: TextStyle(
                            color: onBackground,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: usernameController,
                          style: TextStyle(color: onBackground),
                          decoration: InputDecoration(
                            label: Text(
                              'username',
                              style: themeData.textTheme.caption!
                                  .copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        PasswordTextfiled(
                          onBackground: onBackground,
                          passwordController: passwordController,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(
                                AuthButtonIsClicked(usernameController.text,
                                    passwordController.text));
                          },
                          child: state is AuthLoading
                              ? CircularProgressIndicator()
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Color.fromARGB(158, 54, 54, 54)),
                                ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordTextfiled extends StatefulWidget {
  final TextEditingController passwordController;
  const PasswordTextfiled({
    Key? key,
    required this.onBackground,
    required this.passwordController,
  }) : super(key: key);

  final Color onBackground;

  @override
  State<PasswordTextfiled> createState() => _PasswordTextfiledState();
}

class _PasswordTextfiledState extends State<PasswordTextfiled> {
  bool obSecuredText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.passwordController,
      obscureText: obSecuredText,
      style: TextStyle(color: widget.onBackground),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obSecuredText = !obSecuredText;
            });
          },
          icon: Icon(
            obSecuredText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: widget.onBackground.withOpacity(0.5),
          ),
        ),
        label: Text(
          'password',
          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
