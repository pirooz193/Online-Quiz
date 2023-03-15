import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_test/admin_panel_courses_students.dart';
import 'package:online_exam_test/admin_panel_create_course.dart';
import 'package:online_exam_test/courseQuestions.dart';
import 'package:online_exam_test/main.dart';

class AdminPanelCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            backgroundFirstColor,
            backgroundSecondColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Courses'),
          elevation: 0,
          actions: [
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
                padding: EdgeInsets.only(right: 34),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.add,
                      size: 24,
                      color: themeData.colorScheme.onPrimary,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'New Course',
                      style: themeData.textTheme.bodyText2!.copyWith(
                        color: themeData.colorScheme.onPrimary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 80),
          child: Container(
            height: 1000,
            decoration: BoxDecoration(
              color: themeData.colorScheme.surface,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const TextField(
                        cursorHeight: 20,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: InputBorder.none,
                            prefixIcon: Icon(CupertinoIcons.search),
                            label: Text('Search ...')),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            'Title',
                            overflow: TextOverflow.ellipsis,
                            style: themeData.textTheme.headline6!
                                .copyWith(fontSize: 15),
                          )),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: Text(
                            'Master',
                            overflow: TextOverflow.ellipsis,
                            style: themeData.textTheme.headline6!
                                .copyWith(fontSize: 15),
                          )),
                          Expanded(
                              child: Text(
                            'Capacity',
                            overflow: TextOverflow.ellipsis,
                            style: themeData.textTheme.headline6!
                                .copyWith(fontSize: 15),
                          )),
                          Expanded(
                              child: Center(
                                  child: Text(
                            'Questions',
                            overflow: TextOverflow.ellipsis,
                            style: themeData.textTheme.headline6!
                                .copyWith(fontSize: 15),
                          ))),
                          Expanded(
                              child: Center(
                                  child: Text(
                            'Students',
                            overflow: TextOverflow.ellipsis,
                            style: themeData.textTheme.headline6!
                                .copyWith(fontSize: 15),
                          ))),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 8),
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    'Student  asdfasdfdfdsfsdfsdfsd ',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    'Master',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    '20',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CourseQuestionsScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        'Show',
                                        style: themeData.textTheme.bodyText2!
                                            .copyWith(
                                          color: themeData.colorScheme.primary,
                                        ),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AdminPanelCoursesStudents(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        'Show',
                                        style: themeData.textTheme.bodyText2!
                                            .copyWith(
                                          color: themeData.colorScheme.primary,
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
