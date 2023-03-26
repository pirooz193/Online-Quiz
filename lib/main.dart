import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_exam_test/admin/adminHomeScreen.dart';
import 'package:online_exam_test/admin/adminPanelAllStudents.dart';
import 'package:online_exam_test/admin/adminPanelTeacher.dart';
import 'package:online_exam_test/admin/adminPanelWaitingList.dart';
import 'package:online_exam_test/admin/admin_panel_courses.dart';

import 'package:online_exam_test/courseQuestions.dart';
import 'package:online_exam_test/gen/assets.gen.dart';
import 'package:online_exam_test/splashScreen.dart';

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
      home: MainScreen(
        toggleThemeMode: () {
          setState(() {
            if (_themeMode == ThemeMode.dark)
              _themeMode = ThemeMode.light;
            else
              _themeMode = ThemeMode.dark;
          });
        },
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

class MainScreen extends StatefulWidget {
  final Function() toggleThemeMode;

  const MainScreen({super.key, required this.toggleThemeMode});

  @override
  State<MainScreen> createState() => _MainScreenState(toggleThemeMode);
}

const int courseIndex = 0;
const int studentIndex = 1;
const int homeIndex = 2;
const int teacherIndex = 3;
const int waitingListIndex = 4;
const double bottomNavigationHight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> history = [];
  final Function() toggleThemeMode;

  GlobalKey<NavigatorState> _courseKey = GlobalKey();
  GlobalKey<NavigatorState> _studentKey = GlobalKey();
  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _teacherKey = GlobalKey();
  GlobalKey<NavigatorState> _waitingListKey = GlobalKey();

  late final map = {
    courseIndex: _courseKey,
    studentIndex: _studentKey,
    homeIndex: _homeKey,
    teacherIndex: _teacherKey,
    waitingListIndex: _waitingListKey,
  };

  _MainScreenState(this.toggleThemeMode);

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedNavigatorState.canPop()) {
      currentSelectedNavigatorState.pop();
      return false;
    } else if (history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = history.last;
        history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                bottom: bottomNavigationHight,
                child: IndexedStack(
                  index: selectedScreenIndex,
                  children: [
                    _navigator(_courseKey, AdminPanelCourses(), courseIndex),
                    _navigator(_studentKey, const AdminpanelAllStudentScreen(),
                        studentIndex),
                    _navigator(_homeKey, const AdminHomeScreen(), homeIndex),
                    _navigator(
                        _teacherKey, AdminPanelTeachersScreen(), teacherIndex),
                    _navigator(
                        _waitingListKey, WaitingList(), waitingListIndex),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _ButtomNavigation(
                  toggleThemeMode: toggleThemeMode,
                  selectedIndex: selectedScreenIndex,
                  onTap: (int index) {
                    setState(() {
                      history.remove(selectedScreenIndex);
                      history.add(selectedScreenIndex);
                      selectedScreenIndex = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, Widget screen, int index) {
    return key.currentContext == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Offstage(
                  offstage: selectedScreenIndex != index, child: screen),
            ),
          );
  }
}

class _ButtomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  final Function() toggleThemeMode;
  const _ButtomNavigation({
    Key? key,
    required this.onTap,
    required this.selectedIndex,
    required this.toggleThemeMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      decoration: BoxDecoration(
        color: themeData.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: themeData.colorScheme.onPrimary.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtomNavigationItem(
            iconFileName: 'course.png',
            activeIconFileName: 'course-active.png',
            title: 'Course',
            onTap: () {
              onTap(courseIndex);
            },
            isActive: selectedIndex == courseIndex,
          ),
          ButtomNavigationItem(
            iconFileName: 'student.png',
            activeIconFileName: 'student-active.png',
            title: 'Student',
            onTap: () {
              onTap(studentIndex);
            },
            isActive: selectedIndex == studentIndex,
          ),
          ButtomNavigationItem(
            iconFileName: 'home.png',
            activeIconFileName: 'home-active-2.png',
            title: 'Home',
            onTap: () {
              onTap(homeIndex);
            },
            isActive: selectedIndex == homeIndex,
          ),
          ButtomNavigationItem(
            iconFileName: 'teacher.png',
            activeIconFileName: 'teacher-active.png',
            title: 'Teacher',
            onTap: () {
              onTap(teacherIndex);
            },
            isActive: selectedIndex == teacherIndex,
          ),
          ButtomNavigationItem(
            iconFileName: 'waiting.png',
            activeIconFileName: 'waiting-active.png',
            title: 'Waiting List',
            onTap: () {
              onTap(waitingListIndex);
            },
            isActive: selectedIndex == waitingListIndex,
          ),
          InkWell(
            onTap: toggleThemeMode,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                child: Icon(
                  Icons.sunny,
                  size: 20,
                  color: themeData.colorScheme.onPrimary.withOpacity(0.5),
                )),
          ),
        ],
      ),
    );
  }
}

class ButtomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final Function() onTap;
  final bool isActive;

  const ButtomNavigationItem(
      {Key? key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    String finalIconName = isActive ? activeIconFileName : iconFileName;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/$finalIconName",
              width: isActive ? 35 : 30,
              height: isActive ? 35 : 30,
              color: !isActive ? Colors.grey.shade700 : null,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.caption!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.caption!.color),
            )
          ],
        ),
      ),
    );
  }
}
