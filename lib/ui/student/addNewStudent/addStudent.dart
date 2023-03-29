import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_test/data/source/studentDataSource.dart';
import 'package:online_exam_test/ui/student/addNewStudent/bloc/add_student_bloc.dart';
import 'package:online_exam_test/ui/student/allStudents/allstudents.dart';
import 'package:online_exam_test/ui/student/allStudents/bloc/all_students_bloc.dart';

class AddNewStudentScreen extends StatelessWidget {
  const AddNewStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController studentNameController = TextEditingController();
    final TextEditingController studentLastNameController =
        TextEditingController();
    final TextEditingController studentCodeController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final themeData = Theme.of(context);
    return BlocProvider<AddStudentBloc>(
      create: (context) {
        final studentBloc = AddStudentBloc();
        studentBloc.add(AddStudentStarted());
        return studentBloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Student'),
          elevation: 0,
        ),
        body: BlocBuilder<AddStudentBloc, AddStudentState>(
          builder: (context, state) {
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
                              blurRadius: 10,
                              color: themeData.colorScheme.onPrimary
                                  .withOpacity(0.2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                          child: Column(children: [
                            Center(
                              child: Text(
                                'New Student',
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
                              controller: studentNameController,
                              decoration: InputDecoration(
                                label: Text(
                                  'name',
                                  style: themeData.textTheme.subtitle1!
                                      .copyWith(
                                          color: themeData.colorScheme.onPrimary
                                              .withOpacity(0.8)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextField(
                              controller: studentLastNameController,
                              decoration: InputDecoration(
                                label: Text(
                                  'last name',
                                  style: themeData.textTheme.subtitle1!
                                      .copyWith(
                                          color: themeData.colorScheme.onPrimary
                                              .withOpacity(0.8)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextField(
                              controller: studentCodeController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                label: Text(
                                  'Student Code',
                                  style: themeData.textTheme.subtitle1!
                                      .copyWith(
                                          color: themeData.colorScheme.onPrimary
                                              .withOpacity(0.8)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextField(
                              controller: phoneNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                label: Text(
                                  'Mobile',
                                  style: themeData.textTheme.subtitle1!
                                      .copyWith(
                                          color: themeData.colorScheme.onPrimary
                                              .withOpacity(0.8)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 64,
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  studentRepository.createNewStudent(
                                      studentNameController.text,
                                      studentLastNameController.text,
                                      studentCodeController.text,
                                      phoneNumberController.text);
                                  // BlocProvider.of<AllStudentsBloc>(context)
                                  //     .add(StudentsScreenRefresh());
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.primary,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: Text(
                                      'Add Student',
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
