// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_test/gen/assets.gen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 60, 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                //     child: Text(
                //       'Dashboard',
                //       style: themeData.textTheme.headline4!.apply(
                //         color: themeData.colorScheme.primary,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Wrap(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    direction: Axis.horizontal,
                    spacing: 85,
                    runSpacing: 80,
                    children: [
                      _showApplicationData(
                        context,
                        '58',
                        'Courses',
                        Assets.icons.courseActive.image(),
                      ),
                      _showApplicationData(
                        context,
                        '200',
                        'Students',
                        Assets.icons.studentGreen.image(),
                      ),
                      _showApplicationData(
                        context,
                        '25',
                        'Teachers',
                        Assets.icons.teacherActive.image(),
                      ),
                      _showApplicationData(
                        context,
                        '680',
                        'Questions',
                        Assets.icons.questions.image(),
                      ),
                      _showApplicationData(
                        context,
                        '58',
                        'Waiting List',
                        Assets.icons.waiting2.image(),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                    child: Wrap(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      direction: Axis.horizontal,
                      spacing: 80,
                      runSpacing: 80,
                      children: [
                        Container(
                          padding: EdgeInsets.all(24),
                          width: 500,
                          height: 250,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Top Students',
                                    style: themeData.textTheme.headline6!
                                        .copyWith(fontSize: 16),
                                  ),
                                  Assets.icons.goldCup.image(
                                    width: 24,
                                    height: 24,
                                  ),
                                ],
                              ),
                              Divider(),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 15,
                                  itemBuilder: ((context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 8),
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10),
                                                    child: Text(
                                                      'Student   ',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Column(
                                                      children: const [
                                                        Icon(
                                                          Icons
                                                              .bar_chart_rounded,
                                                          color: Colors.grey,
                                                        ),
                                                        Text('143'),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(24),
                          width: 500,
                          height: 250,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Messages',
                                    style: themeData.textTheme.headline6!
                                        .copyWith(fontSize: 16),
                                  ),
                                  Assets.icons.message.image(
                                    width: 24,
                                    height: 24,
                                  ),
                                ],
                              ),
                              Divider(),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 15,
                                  itemBuilder: ((context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(top: 8),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Text(
                                                  'Student',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showApplicationData(
      BuildContext context, String number, String title, Image image) {
    final themeData = Theme.of(context);
    return Container(
      width: 165,
      height: 165,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: themeData.textTheme.headline4!.apply(color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            image,
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.black38),
            )
          ],
        ),
      ),
    );
  }
}
