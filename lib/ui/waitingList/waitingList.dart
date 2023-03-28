import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaitingList extends StatelessWidget {
  const WaitingList({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waiting List'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.onPrimary.withOpacity(0.4),
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
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 0, right: 0, bottom: 8),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Student name ',
                                      style: themeData.textTheme.headline6!
                                          .copyWith(
                                        fontSize: 14,
                                        color: themeData.colorScheme.onPrimary,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      '0912xxx1122',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          themeData.textTheme.caption!.copyWith(
                                        fontSize: 15,
                                        color: themeData.colorScheme.onPrimary
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                'student code',
                                style: themeData.textTheme.headline6!.copyWith(
                                  fontSize: 14,
                                  color: themeData.colorScheme.onPrimary
                                      .withOpacity(0.6),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.check,
                                size: 30,
                                color: Colors.green,
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
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
