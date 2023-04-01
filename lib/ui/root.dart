import 'package:flutter/material.dart';
import 'package:online_exam_test/data/repo/authrepository.dart';
import 'package:online_exam_test/ui/auth/auth.dart';
import 'package:online_exam_test/ui/auth/bloc/auth_bloc.dart';
import 'package:online_exam_test/ui/course/allCourses/allCourses.dart';
import 'package:online_exam_test/ui/home/home.dart';

import 'student/allStudents/allstudents.dart';
import 'teacher/all_teachers/teachers.dart';
import 'waitingList/waitingList.dart';

class RootScreen extends StatefulWidget {
  final Function() toggleThemeMode;

  const RootScreen({super.key, required this.toggleThemeMode});

  @override
  State<RootScreen> createState() => _RootScreenState(toggleThemeMode);
}

const int courseIndex = 0;
const int studentIndex = 1;
const int homeIndex = 2;
const int teacherIndex = 3;
const int waitingListIndex = 4;
const double bottomNavigationHight = 65;

class _RootScreenState extends State<RootScreen> {
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

  _RootScreenState(this.toggleThemeMode);

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
    return ValueListenableBuilder(
      valueListenable: AuthRepository.authChangedNotifier,
      builder: (context, authState, child) {
        if (authState != null && authState!.accessToken.isNotEmpty) {
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
                          _navigator(
                              _courseKey, AdminPanelCourses(), courseIndex),
                          _navigator(_studentKey, const AllStudentsScreen(),
                              studentIndex),
                          _navigator(
                              _homeKey, const AdminHomeScreen(), homeIndex),
                          _navigator(_teacherKey, AdminPanelTeachersScreen(),
                              teacherIndex),
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
        } else
          return AuthScreen();
      },
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
