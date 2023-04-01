import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_exam_test/data/repo/authrepository.dart';

import 'ui/root.dart';

void main() {
  if (themeMode == ThemeMode.dark) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 30, 30, 30),
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color.fromARGB(255, 30, 30, 30),
          systemNavigationBarIconBrightness: Brightness.light),
    );
  } else {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
    );
  }

  // const SplashScreen();
  WidgetsFlutterBinding.ensureInitialized();
  authRepository.loadAuthInfo();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

ThemeMode themeMode = ThemeMode.light;

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Quiz',
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getThemeData()
          : MyAppThemeConfig.light().getThemeData(),
      home: Directionality(
        textDirection: TextDirection.ltr,
        child:
            // AuthScreen(),

            RootScreen(
          toggleThemeMode: () {
            setState(() {
              if (themeMode == ThemeMode.dark) {
                themeMode = ThemeMode.light;
              } else {
                themeMode = ThemeMode.dark;
              }
            });
          },
        ),
      ),
    );
  }
}

class MyAppThemeConfig {
  final Color primaryColor = const Color.fromARGB(255, 105, 129, 236);

  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color onPrimary;
  final Color scaffoldBackgroundColor;
  final Color appBarColor;
  final Brightness brightness;
  MyAppThemeConfig(
      {required this.brightness,
      required this.primaryTextColor,
      required this.secondaryTextColor,
      required this.surfaceColor,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.onPrimary,
      required this.scaffoldBackgroundColor,
      required this.appBarColor});

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = Colors.black.withOpacity(0.6),
        backgroundColor = const Color.fromARGB(255, 30, 30, 30),
        onPrimary = Colors.white,
        foregroundColor = Colors.white,
        // scaffoldBackgroundColor = Color(0x0dffffff),
        scaffoldBackgroundColor = const Color.fromARGB(158, 54, 54, 54),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        onPrimary = Colors.black,
        secondaryTextColor = const Color.fromARGB(255, 22, 32, 26),
        surfaceColor = Colors.white,
        backgroundColor = Colors.white,
        foregroundColor = Colors.grey.shade700,
        scaffoldBackgroundColor = const Color.fromARGB(255, 209, 229, 255),
        appBarColor = const Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  TextStyle defaultTextStyle = const TextStyle(fontFamily: 'IranYekan');
  ThemeData getThemeData() {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(const TextStyle(
                color: Color.fromARGB(158, 54, 54, 54),
              )),
              minimumSize: MaterialStateProperty.all(
                const Size.fromHeight(56),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
              backgroundColor: MaterialStateProperty.all(Colors.white)))
      // scaffoldBackgroundColor: Colors.grey.shade300,
      ,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
          toolbarHeight: 50,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0),
      textTheme: TextTheme(
        bodyText2: defaultTextStyle.copyWith(
          fontSize: 20,
          color: onPrimary,
        ),
        headline4: defaultTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: onPrimary,
        ),
        headline5: defaultTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: onPrimary,
        ),
        headline6: defaultTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: onPrimary,
        ),
        subtitle1: defaultTextStyle.copyWith(fontSize: 12, color: onPrimary),
        subtitle2: defaultTextStyle.copyWith(fontSize: 15, color: onPrimary),
        caption: defaultTextStyle.copyWith(color: Colors.grey, fontSize: 10),
      ),
      colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryTextColor,
          onPrimary: onPrimary,
          surface: surfaceColor),
    );
  }
}
