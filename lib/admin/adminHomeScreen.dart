import 'package:flutter/material.dart';
import 'package:online_exam_test/gen/assets.gen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: themeData.textTheme.headline5!.copyWith(fontSize: 20),
        ),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Logout',
                  style: themeData.textTheme.subtitle2!
                      .copyWith(color: Colors.grey.shade700),
                ),
                IconButton(
                  onPressed: () {
                    // Navigator.of(context).;
                  },
                  icon: const Icon(Icons.logout, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Expanded(
            child: Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
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
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 80, 16, 0),
                        child: Wrap(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          direction: Axis.horizontal,
                          spacing: 80,
                          runSpacing: 80,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(24),
                              width: 600,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: themeData.colorScheme.surface,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color(0xff988487).withOpacity(0.4),
                                  ),
                                ],
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
                                  const Divider(),
                                  Expanded(
                                    child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: 15,
                                      itemBuilder: ((context, index) {
                                        return Column(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 8),
                                              height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Expanded(
                                                      child: Text(
                                                        'Student   ',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Column(
                                                      children: const [
                                                        Icon(
                                                          Icons
                                                              .bar_chart_rounded,
                                                          color: Colors.grey,
                                                        ),
                                                        Text('143'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(),
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(24),
                              width: 600,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: themeData.colorScheme.surface,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: const Color(0xff988487)
                                        .withOpacity(0.4),
                                  ),
                                ],
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
                                      Icon(Icons.email)
                                    ],
                                  ),
                                  const Divider(),
                                  Expanded(
                                    child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: 15,
                                      itemBuilder: ((context, index) {
                                        return Column(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 8),
                                              height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Message textMessage textMessage textMessagetextMessage textMessage textMessage text',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: themeData
                                                            .textTheme.caption!
                                                            .copyWith(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 60,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: const [
                                                        Icon(
                                                          Icons.message,
                                                          color: Colors.grey,
                                                        ),
                                                        Text('student name'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(),
                                          ],
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
        ),
      ),
    );
  }

  Widget _showApplicationData(
      BuildContext context, String number, String title, Image image) {
    final themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: 35),
      width: 165,
      height: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Color(0xff988487).withOpacity(0.4),
          ),
        ],
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
