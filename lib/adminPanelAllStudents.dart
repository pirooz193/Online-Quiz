import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'admin_panel_add_student.dart';

final backgroundFirstColor = Colors.grey.shade300;
final backgroundSecondColor = Colors.grey.shade200;

class AdminpanelAllStudentScreen extends StatelessWidget {
  const AdminpanelAllStudentScreen({super.key});

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
          title: const Text('Students'),
          elevation: 0,
          actions: [
            TextButton(
              // padding: EdgeInsets.only(right: 40),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddNewStudentToCourseScreen(),
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
                      color: Colors.black,
                    ),
                    SizedBox(
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
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const TextField(
                              cursorHeight: 20,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
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
                                  'Full-name',
                                  style: themeData.textTheme.headline6,
                                )),
                                Expanded(
                                    child: Center(
                                        child: Text(
                                  'Code',
                                  style: themeData.textTheme.headline6,
                                ))),
                                Expanded(
                                    child: Center(
                                        child: Text(
                                  'Phone',
                                  style: themeData.textTheme.headline6,
                                ))),
                                Expanded(child: SizedBox()),
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
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Student  asdfasdfdfdsfsdfsdfsd ffffffffffddddddddddddddddddddddddddddddddddddfff',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Center(
                                          child: Text(
                                            'Student',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Center(
                                          child: Text(
                                            'Student',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red.shade400,
                                            ),
                                          )),
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
      ),
    );
  }
}
