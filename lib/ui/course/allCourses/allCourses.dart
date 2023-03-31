import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_test/data/course.dart';
import 'package:online_exam_test/ui/course/allCourses/bloc/all_courses_bloc.dart';
import 'package:online_exam_test/ui/course/student/allStudents.dart';
import 'package:online_exam_test/ui/course/add_new_course/addNewCourse.dart';
import 'package:online_exam_test/ui/course/question/questions.dart';

class AdminPanelCourses extends StatelessWidget {
  const AdminPanelCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider<AllCoursesBloc>(
      create: (context) {
        final allCoursesBloc = AllCoursesBloc();
        allCoursesBloc.add(AllCoursesStartetd());
        return allCoursesBloc;
      },
      child: BlocBuilder<AllCoursesBloc, AllCoursesState>(
        builder: (context, state) {
          if (state is AllCoursesuccess) {
            List<CourseEntity> courses = state.allCourses;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Courses'),
                elevation: 0,
                actions: [
                  BlocBuilder<AllCoursesBloc, AllCoursesState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Text(
                            'Refresh',
                            style: themeData.textTheme.caption,
                          ),
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<AllCoursesBloc>(context)
                                    .add(RefreshAllCourses());
                              },
                              icon: Icon(Icons.refresh)),
                        ],
                      );
                    },
                  ),
                  TextButton(
                    // padding: EdgeInsets.only(right: 40),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CreateCourseScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 34),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.add,
                            size: 24,
                            color: themeData.colorScheme.onPrimary,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'New Course',
                            style: themeData.textTheme.bodyText2!.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 40,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const TextField(
                                cursorHeight: 20,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    CupertinoIcons.search,
                                  ),
                                  label: Text(
                                    'Search ...',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: courses.length,
                            itemBuilder: ((context, index) {
                              final course = courses[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, bottom: 8),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: themeData.colorScheme.surface,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: themeData.colorScheme.onPrimary
                                            .withOpacity(0.2),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 32),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  course.courseTitle,
                                                  style: themeData
                                                      .textTheme.headline6!
                                                      .copyWith(
                                                    fontSize: 14,
                                                    color: themeData
                                                        .colorScheme.onPrimary
                                                        .withOpacity(0.9),
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: 14,
                                                ),
                                                Text(
                                                  course.teacher != null
                                                      ? '${course.teacher!.name} ${course.teacher!.lastName}'
                                                      : '-',
                                                  style: themeData
                                                      .textTheme.headline6!
                                                      .copyWith(
                                                    fontSize: 14,
                                                    color: themeData
                                                        .colorScheme.onPrimary
                                                        .withOpacity(0.5),
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              course.students.length.toString(),
                                              style: themeData
                                                  .textTheme.subtitle1!
                                                  .copyWith(
                                                fontSize: 15,
                                                color: themeData
                                                    .colorScheme.onPrimary
                                                    .withOpacity(0.7),
                                              ),
                                            ),
                                            Text(
                                              '/${course.capacity}',
                                              style: themeData
                                                  .textTheme.subtitle1!
                                                  .copyWith(
                                                fontSize: 15,
                                                color: themeData
                                                    .colorScheme.onPrimary
                                                    .withOpacity(0.7),
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CourseQuestionsScreen(),
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.question_mark,
                                                color: themeData
                                                    .colorScheme.primary,
                                              ),
                                            ),
                                            Text(
                                              'questions',
                                              style: themeData
                                                  .textTheme.caption!
                                                  .copyWith(
                                                fontSize: 10,
                                                color: themeData
                                                    .colorScheme.onPrimary
                                                    .withOpacity(0.7),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AdminPanelCoursesStudents(),
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.people_alt,
                                                color: themeData
                                                    .colorScheme.primary,
                                              ),
                                            ),
                                            Text(
                                              'students',
                                              style: themeData
                                                  .textTheme.caption!
                                                  .copyWith(
                                                fontSize: 10,
                                                color: themeData
                                                    .colorScheme.onPrimary
                                                    .withOpacity(0.7),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ]),
                ),
              ),
            );
          } else if (state is CoursesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CoursesError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.exception.message),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AllCoursesBloc>(context)
                              .add(RefreshAllCourses());
                        },
                        child: Text(
                          'Try again!',
                          style: TextStyle(color: Colors.grey.shade600),
                        )),
                  ),
                )
              ],
            );
          } else {
            throw Exception('state is not stable');
          }
        },
      ),
    );
  }
}
