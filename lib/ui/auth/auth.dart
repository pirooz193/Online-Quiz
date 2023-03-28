import 'package:flutter/material.dart';
import 'package:online_exam_test/data/repo/authrepository.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final onBackground = Colors.white;
    return Theme(
      data: themeData.copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    Size.fromHeight(56),
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
        backgroundColor: themeData.colorScheme.secondary,
        body: Padding(
          padding: const EdgeInsets.only(left: 48, right: 48),
          child: Center(
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
                    style: TextStyle(color: onBackground),
                    decoration: InputDecoration(
                      label: Text(
                        'username',
                        style:
                            themeData.textTheme.caption!.copyWith(fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  PasswordTextfiled(onBackground: onBackground),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      authRepository.login("admin", "admin");
                    },
                    child: Text('Login'),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordTextfiled extends StatefulWidget {
  const PasswordTextfiled({
    Key? key,
    required this.onBackground,
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
