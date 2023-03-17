import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_test/admin/admin_panel_courses_students.dart';
import 'package:online_exam_test/admin/admin_panel_create_course.dart';
import 'package:online_exam_test/courseQuestions.dart';

class AdminPanelCourses extends StatelessWidget {
  const AdminPanelCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
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
              padding: const EdgeInsets.only(right: 34),
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.add,
                    size: 24,
                    color: Colors.black,
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
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
                      floatingLabelBehavior: FloatingLabelBehavior.never,
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
                itemCount: 15,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 0, right: 0, bottom: 8),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Course name ',
                                      style: themeData.textTheme.headline6!
                                          .copyWith(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'Master',
                                      style: themeData.textTheme.headline6!
                                          .copyWith(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  '0',
                                  style:
                                      themeData.textTheme.subtitle1!.copyWith(
                                    fontSize: 15,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Text(
                                  '/20',
                                  style:
                                      themeData.textTheme.subtitle1!.copyWith(
                                    fontSize: 15,
                                    color: Colors.grey.shade700,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CourseQuestionsScreen(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.question_mark,
                                    color: themeData.colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  'questions',
                                  style: themeData.textTheme.caption!.copyWith(
                                      fontSize: 10,
                                      color: Colors.grey.shade700),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AdminPanelCoursesStudents(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.people_alt,
                                    color: themeData.colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  'students',
                                  style: themeData.textTheme.caption!.copyWith(
                                      fontSize: 10,
                                      color: Colors.grey.shade700),
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
  }
}
