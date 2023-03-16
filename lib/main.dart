import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_exam_test/adminHomeScreen.dart';
import 'package:online_exam_test/adminPanelAllStudents.dart';
import 'package:online_exam_test/adminPanelTeacher.dart';
import 'package:online_exam_test/adminPanelWaitingList.dart';
import 'package:online_exam_test/admin_panel_courses.dart';
import 'package:online_exam_test/admin_panel_courses_students.dart';
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
  const SplashScreen();
  runApp(const MyApp());
}

final backgroundFirstColor = Colors.grey.shade300;
final backgroundSecondColor = Colors.grey.shade200;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Quiz',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey.shade700,
          elevation: 0,
        ),
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
          caption: TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 105, 129, 236),
          secondary: Color.fromARGB(255, 22, 32, 26),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
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
  const _ButtomNavigation({
    Key? key,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Color(0xff988487).withOpacity(0.6),
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
