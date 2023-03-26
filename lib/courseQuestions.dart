import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_test/admin/adminHomeScreen.dart';
import 'package:online_exam_test/main.dart';

class CourseQuestionsScreen extends StatelessWidget {
  const CourseQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Course / Questions'),
          elevation: 0,
          actions: [
            TextButton(
              // padding: EdgeInsets.only(right: 40),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 34),
                child: Row(
                  children: [
                    Icon(
                      Icons.pause,
                      size: 24,
                      color: themeData.appBarTheme.foregroundColor,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Finish',
                      style: themeData.textTheme.headline6!.copyWith(
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
          child: Container(
            height: 1000,
            decoration: BoxDecoration(
              color: themeData.colorScheme.surface,
              // borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: themeData.colorScheme.onPrimary.withOpacity(0.2),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Text(
                            'Java / Spring',
                            style: themeData.textTheme.subtitle2,
                          )),
                          Expanded(
                              child: Text(
                            'Questions',
                            style: themeData.textTheme.headline6,
                          )),
                          Text(
                            'Time : 30m',
                            style: themeData.textTheme.subtitle2!.copyWith(
                              color: themeData.colorScheme.onPrimary
                                  .withOpacity(0.5),
                            ),
                          ),
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
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Expanded(
                                      child: Text(
                                          '1.Which of the following is NOT a benefit of using Java?'),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text('Score: 2')
                                  ],
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          MyCheckBox(
                                            value: false,
                                            onTap: () {},
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text('1.test'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          MyCheckBox(
                                            value: false,
                                            onTap: () {},
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text('1.test'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          MyCheckBox(
                                            value: false,
                                            onTap: () {},
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text('1.test'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          MyCheckBox(
                                            value: true,
                                            onTap: () {},
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text('1.test'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Divider(),
                                    ],
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
          ),
        ),
      ),
    );
  }
}

class MyCheckBox extends StatelessWidget {
  final bool value;
  final GestureTapCallback onTap;

  const MyCheckBox({super.key, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: !value
              ? Border.all(
                  color: Colors.red,
                  width: 2,
                )
              : null,
          color: value ? Colors.green : null,
        ),
        child: value
            ? Icon(
                CupertinoIcons.check_mark,
                color: themeData.colorScheme.onPrimary,
                size: 16,
              )
            : null,
      ),
    );
  }
}
