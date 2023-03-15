import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_test/adminHomeScreen.dart';
import 'package:online_exam_test/admin_panel_courses.dart';
import 'package:online_exam_test/admin_panel_courses_students.dart';
import 'package:online_exam_test/courseQuestions.dart';
import 'package:online_exam_test/gen/assets.gen.dart';

void main() {
  runApp(const MyApp());
}

// final backgroundFirstColor = Color.fromARGB(255, 232, 226, 247);
final backgroundFirstColor = Color.fromARGB(255, 218, 236, 248);
final backgroundSecondColor = Color.fromARGB(255, 218, 236, 248);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Quiz',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline4: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          headline5: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          headline6: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          subtitle1: TextStyle(
            fontSize: 12,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 105, 129, 236),
          // primary: Color.fromARGB(255, 139, 100, 231),
          // primary: Color.fromARGB(255, 120, 67, 241),
          // primary: Color.fromARGB(255, 132, 173, 149),
          secondary: Color.fromARGB(255, 22, 32, 26),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: themeData.textTheme.headline5!.apply(
            color: themeData.colorScheme.onPrimary,
          ),
        ),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'Logout',
                    style: themeData.textTheme.subtitle2!
                        .copyWith(color: themeData.colorScheme.onPrimary),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.logout,
                        color: themeData.colorScheme.onPrimary),
                  ),
                ],
              )),
        ],
      ),
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              backgroundFirstColor,
              backgroundSecondColor
              // Colors.white70,
            ],
          ),
        ),
        child: Stack(
          children: [
            // CourseQuestionsScreen()
            AdminHomeScreen(),

            const Positioned(
              bottom: 0,
              child: _MenuBar(),
            ),
          ],
        ),
      )),
    );
  }
}

class _MenuBar extends StatelessWidget {
  const _MenuBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      decoration: BoxDecoration(
        color: themeData.colorScheme.primary,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16), topLeft: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AdminPanelCourses(),
                          ),
                        );
                      },
                      icon: Assets.icons.course.image(
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Text(
                      'Course',
                      style: themeData.textTheme.subtitle1!
                          .apply(color: themeData.colorScheme.onPrimary),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Assets.icons.student.image(
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Text(
                      'Student',
                      style: themeData.textTheme.subtitle1!
                          .apply(color: themeData.colorScheme.onPrimary),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Assets.icons.home.image(
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Text(
                        'Home',
                        style: themeData.textTheme.subtitle1!
                            .apply(color: themeData.colorScheme.onPrimary),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Assets.icons.teacher.image(
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Text(
                      'Teacher',
                      style: themeData.textTheme.caption!
                          .apply(color: themeData.colorScheme.onPrimary),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Assets.icons.waiting.image(
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Text(
                      'waiting List',
                      style: themeData.textTheme.subtitle1!
                          .apply(color: themeData.colorScheme.onPrimary),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
