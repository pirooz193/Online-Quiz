import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_test/adminHomeScreen.dart';
import 'package:online_exam_test/main.dart';

class CourseQuestionsScreen extends StatelessWidget {
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
        // floatingActionButton: FloatingActionButton.extended(
        //     onPressed: () {}, label: Text('Finish')),
        backgroundColor: Colors.transparent,
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
                padding: EdgeInsets.only(right: 34),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.add,
                      size: 24,
                      color: themeData.colorScheme.onPrimary,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Finish',
                      style: themeData.textTheme.bodyText2!.copyWith(
                        color: themeData.colorScheme.onPrimary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Padding(
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
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Expanded(child: Text('Java / Spring')),
                          Expanded(child: Text('Questions')),
                          Text('Time : 30m'),
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
                        margin: EdgeInsets.only(top: 12),
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                        '1.Which of the following is NOT a benefit of using Java?'),
                                  ),
                                  Text('Score: 2')
                                ],
                              ),
                              SizedBox(
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
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('1.test'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        MyCheckBox(
                                          value: false,
                                          onTap: () {},
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('1.test'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        MyCheckBox(
                                          value: false,
                                          onTap: () {},
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('1.test'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        MyCheckBox(
                                          value: true,
                                          onTap: () {},
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('1.test'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
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
