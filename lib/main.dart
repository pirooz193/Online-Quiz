import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_exam_test/ui/auth/auth.dart';
import 'package:online_exam_test/ui/home/home.dart';
import 'package:online_exam_test/ui/root.dart';
import 'package:online_exam_test/ui/student/allstudents.dart';
import 'package:online_exam_test/ui/teacher/teachers.dart';
import 'package:online_exam_test/ui/waitingList/waitingList.dart';
import 'package:online_exam_test/ui/course/allCourses.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  // const SplashScreen();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Quiz',
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getThemeData()
          : MyAppThemeConfig.light().getThemeData(),
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: AuthScreen(),

        // RootScreen(
        //   toggleThemeMode: () {
        //     setState(() {
        //       if (_themeMode == ThemeMode.dark)
        //         _themeMode = ThemeMode.light;
        //       else
        //         _themeMode = ThemeMode.dark;
        //     });
        //   },
        // ),
      ),
    );
  }
}

class MyAppThemeConfig {
  final Color primaryColor = Color.fromARGB(255, 105, 129, 236);

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
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        onPrimary = Colors.white,
        foregroundColor = Colors.white,
        // scaffoldBackgroundColor = Color(0x0dffffff),
        scaffoldBackgroundColor = Color.fromARGB(158, 54, 54, 54),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        onPrimary = Colors.black,
        secondaryTextColor = Color.fromARGB(255, 22, 32, 26),
        surfaceColor = Colors.white,
        backgroundColor = Colors.white,
        foregroundColor = Colors.grey.shade700,
        scaffoldBackgroundColor = Color.fromARGB(255, 209, 229, 255),
        appBarColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getThemeData() {
    return ThemeData(
      // scaffoldBackgroundColor: Colors.grey.shade300,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
          toolbarHeight: 50,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0),
      textTheme: TextTheme(
        bodyText2: TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: 20,
          color: onPrimary,
        ),
        headline4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: onPrimary,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: onPrimary,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: onPrimary,
        ),
        subtitle1: TextStyle(fontSize: 12, color: onPrimary),
        subtitle2: TextStyle(fontSize: 15, color: onPrimary),
        caption: TextStyle(color: Colors.grey, fontSize: 10),
      ),
      colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryTextColor,
          onPrimary: onPrimary,
          surface: surfaceColor),
    );
  }
}
