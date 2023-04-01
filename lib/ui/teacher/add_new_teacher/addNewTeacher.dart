import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_test/data/repo/teacherRepository.dart';
import 'package:online_exam_test/ui/teacher/add_new_teacher/bloc/add_new_teacher_bloc.dart';
import 'package:online_exam_test/ui/teacher/all_teachers/bloc/teachers_bloc.dart';

class AdminPanelAddNewTeacherScreen extends StatelessWidget {
  const AdminPanelAddNewTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController teacherCodeController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final themeData = Theme.of(context);
    return BlocProvider<AddNewTeacherBloc>(
      create: (context) {
        final teacherBloc = AddNewTeacherBloc();
        teacherBloc.add(AddTeacherStarted());
        return teacherBloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Teacher'),
          elevation: 0,
        ),
        body: BlocBuilder<AddNewTeacherBloc, AddNewTeacherState>(
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 80),
                  child: Center(
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
                              'New Teacher',
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
                            controller: nameController,
                            decoration: InputDecoration(
                              label: Text(
                                'name',
                                style: themeData.textTheme.subtitle1!.copyWith(
                                    color: themeData.colorScheme.onPrimary
                                        .withOpacity(0.8)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          TextField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                              label: Text(
                                'last name',
                                style: themeData.textTheme.subtitle1!.copyWith(
                                    color: themeData.colorScheme.onPrimary
                                        .withOpacity(0.8)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          TextField(
                            controller: teacherCodeController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              label: Text(
                                'Teacher Code',
                                style: themeData.textTheme.subtitle1!.copyWith(
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
                                style: themeData.textTheme.subtitle1!.copyWith(
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
                                teacherRepository.addNewTeacher(
                                    nameController.text,
                                    lastNameController.text,
                                    teacherCodeController.text,
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
                                    'Add Teacher',
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
            );
          },
        ),
      ),
    );
  }
}
