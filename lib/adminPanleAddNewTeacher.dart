import 'package:flutter/material.dart';
import 'package:online_exam_test/main.dart';

class AdminPanelAddNewTeacherScreen extends StatelessWidget {
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
          title: const Text('Add New Teacher'),
          elevation: 0,
        ),
        body: SafeArea(
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
                          color: Colors.grey.shade300,
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
                        SizedBox(
                          height: 16,
                        ),
                        const Divider(),
                        SizedBox(
                          height: 32,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            label: Text('Full-name'),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        const TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text('Teacher Code'),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        const TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text('Mobile'),
                          ),
                        ),
                        SizedBox(
                          height: 64,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              height: 60,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: themeData.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  'Add Teacher',
                                  style: themeData.textTheme.bodyText2!
                                      .copyWith(
                                          color:
                                              themeData.colorScheme.onPrimary),
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
        ),
      ),
    );
  }
}
