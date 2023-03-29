import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_test/data/source/studentDataSource.dart';
import 'package:online_exam_test/ui/student/allStudents/bloc/all_students_bloc.dart';

import '../addNewStudent/addStudent.dart';

class AllStudentsScreen extends StatefulWidget {
  const AllStudentsScreen({super.key});

  @override
  State<AllStudentsScreen> createState() => _AllStudentsScreenState();
}

class _AllStudentsScreenState extends State<AllStudentsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider<AllStudentsBloc>(
      create: (context) {
        final studentsBloc = AllStudentsBloc(studentRepository);
        studentsBloc.add(StudentsScreenStarted());
        return studentsBloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Students'),
          elevation: 0,
          actions: [
            BlocBuilder<AllStudentsBloc, AllStudentsState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      BlocProvider.of<AllStudentsBloc>(context)
                          .add(StudentsScreenRefresh());
                    },
                    icon: Icon(Icons.refresh));
              },
            ),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              // padding: EdgeInsets.only(right: 40),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddNewStudentScreen(),
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
                      'New Student',
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
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
                child: BlocBuilder<AllStudentsBloc, AllStudentsState>(
                  builder: (context, state) {
                    if (state is StudentsSuccess) {
                      return ListView.builder(
                        itemCount: state.students.length,
                        itemBuilder: ((context, index) {
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
                                              state.students[index].username,
                                              style: themeData
                                                  .textTheme.headline6!
                                                  .copyWith(
                                                fontSize: 14,
                                                color: themeData
                                                    .colorScheme.onPrimary,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              state.students[index].studentCode
                                                  .split("-")[1],
                                              style: themeData
                                                  .textTheme.headline6!
                                                  .copyWith(
                                                fontSize: 14,
                                                color: themeData
                                                    .colorScheme.onPrimary
                                                    .withOpacity(0.4),
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      state.students[index].phoneNumber,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: themeData.textTheme.subtitle1!
                                          .copyWith(
                                        fontSize: 15,
                                        color: themeData.colorScheme.onPrimary
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        size: 30,
                                        color: Colors.red.shade300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    } else if (state is StudentLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is AllStudentsError) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(state.exception.message),
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<AllStudentsBloc>(context)
                                    .add(StudentsScreenRefresh());
                              },
                              child: Text('Try again!'))
                        ],
                      );
                    } else
                      throw Exception('state is not stable');
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
