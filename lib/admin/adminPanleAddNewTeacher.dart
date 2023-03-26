import 'package:flutter/material.dart';

class AdminPanelAddNewTeacherScreen extends StatelessWidget {
  const AdminPanelAddNewTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Teacher',
        ),
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
                        blurRadius: 10,
                        color: themeData.colorScheme.onPrimary.withOpacity(0.3),
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
                      TextField(
                        decoration: InputDecoration(
                          label: Text(
                            'full-name',
                            style: themeData.textTheme.subtitle1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text(
                            'Teacher Code',
                            style: themeData.textTheme.subtitle1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text(
                            'Mobile',
                            style: themeData.textTheme.subtitle1,
                          ),
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
      ),
    );
  }
}
