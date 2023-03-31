import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_test/data/repo/courseRepository.dart';
import 'package:online_exam_test/ui/course/add_new_course/bloc/add_course_bloc.dart';
import 'package:online_exam_test/ui/course/allCourses/bloc/all_courses_bloc.dart';

class CreateCourseScreen extends StatelessWidget {
  final TextEditingController courseTitleController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController teacherCodeController = TextEditingController();
  CreateCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider<AddCourseBloc>(
      create: (context) {
        final createcourseBloc = AddCourseBloc();
        createcourseBloc.add(CreateCourseStarted());
        return createcourseBloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Create New Course',
          ),
          elevation: 0,
        ),
        body: BlocBuilder<AddCourseBloc, AddCourseState>(
          builder: (context, state) {
            if (state is CreateCourseSuccess) {
              Navigator.of(context).pop();
            }
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 80),
                  child: Center(
                    child: Expanded(
                      child: Container(
                        // height: 1000,
                        width: 500,
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: themeData.colorScheme.onPrimary
                                  .withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                          child: Column(children: [
                            Center(
                              child: Text(
                                'New Course',
                                style: themeData.textTheme.headline6,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 32,
                            ),
                            TextField(
                              controller: courseTitleController,
                              decoration: InputDecoration(
                                label: Text(
                                  'Title',
                                  style: themeData.textTheme.subtitle1,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextField(
                              controller: teacherCodeController,
                              decoration: InputDecoration(
                                label: Text(
                                  'Master Code',
                                  style: themeData.textTheme.subtitle1,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextField(
                              controller: capacityController,
                              decoration: InputDecoration(
                                label: Text(
                                  'Capacity',
                                  style: themeData.textTheme.subtitle1,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 64,
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  context.read<AddCourseBloc>().add(
                                      CreateCourseButtonClicked(
                                          courseTitleController.text,
                                          teacherCodeController.text,
                                          int.parse(capacityController.text)));

                                  // BlocProvider.of<AddCourseBloc>(context)
                                  //     .onEvent(CreateCourseButtonClicked(
                                  //         courseTitleController.text,
                                  //         teacherCodeController.text,
                                  //         int.parse(capacityController.text)));
                                },
                                child: Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.primary,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: Text(
                                      'Create Course',
                                      style: themeData.textTheme.bodyText1!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
