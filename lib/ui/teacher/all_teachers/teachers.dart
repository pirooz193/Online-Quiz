import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_test/data/teacher.dart';
import 'package:online_exam_test/ui/teacher/add_new_teacher/addNewTeacher.dart';
import 'package:online_exam_test/ui/teacher/all_teachers/bloc/teachers_bloc.dart';

class AdminPanelTeachersScreen extends StatelessWidget {
  const AdminPanelTeachersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider<TeachersBloc>(
      create: (context) {
        final bloc = TeachersBloc();
        bloc.add(TeachersScreenStarted());
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Teachers'),
          elevation: 0,
          actions: [
            BlocBuilder<TeachersBloc, TeachersState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Text(
                      'Refresh',
                      style: themeData.textTheme.caption,
                    ),
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<TeachersBloc>(context)
                              .add(TeachersScreenRefresh());
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
                    builder: (context) => const AdminPanelAddNewTeacherScreen(),
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
                      'New Teacher',
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
        body: BlocBuilder<TeachersBloc, TeachersState>(
          builder: (context, state) {
            if (state is TeachersSuccess) {
              List<TeacherEntity> teachers = state.teachers;
              return SafeArea(
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
                            itemCount: teachers.length,
                            itemBuilder: ((context, index) {
                              var teacher = teachers[index];
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
                                                  '${teacher.name} ${teacher.lastName}',
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
                                                  height: 6,
                                                ),
                                                Text(
                                                  teacher.teacherCode
                                                      .split('-')[1],
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
                                          width: 4,
                                        ),
                                        Text(
                                          teacher.phoneNumber,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: themeData.textTheme.subtitle1!
                                              .copyWith(
                                            fontSize: 15,
                                            color: themeData
                                                .colorScheme.onPrimary
                                                .withOpacity(0.8),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            BlocProvider.of<TeachersBloc>(
                                                    context)
                                                .add(DeleteIconClicked(
                                                    teacher.teacherCode));
                                          },
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
                          ),
                        ),
                      ]),
                ),
              );
            } else if (state is TeachersLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is TeachersError) {
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
                            BlocProvider.of<TeachersBloc>(context)
                                .add(TeachersScreenRefresh());
                          },
                          child: Text(
                            'Try again!',
                            style: TextStyle(color: Colors.grey.shade600),
                          )),
                    ),
                  )
                ],
              );
            } else
              throw Exception('state is not stable');
          },
        ),
      ),
    );
  }
}
