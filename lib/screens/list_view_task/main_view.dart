import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/screens/list_view_task/second_view.dart';

class ListViewTask extends StatefulWidget {
  const ListViewTask({Key? key}) : super(key: key);

  @override
  State<ListViewTask> createState() => _ListViewTaskState();
}

class _ListViewTaskState extends State<ListViewTask> {
  static const int _count = 10;
  final List<bool> _checks = List.generate(_count, (_) => false);
  late List<dynamic> checkedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: _count,
                    itemBuilder: (_, i) {
                      return Stack(
                        children: [
                          Container(
                            color: Colors.amberAccent,
                            height: Get.height,
                            width: Get.width,
                            alignment: Alignment.center,
                            child: Text(
                              'Box $i',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Checkbox(
                              value: _checks[i],
                              onChanged: (val) {
                                setState(() {
                                  if (checkedItems.contains(i)) {
                                    checkedItems.remove(i);
                                  } else {
                                    checkedItems.add(i);
                                  }
                                  _checks[i] = val!;
                                  // checkedItems = _checks;
                                  print(checkedItems);
                                });
                                // _checks[i] == checkedItems;
                                print(checkedItems);
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => SecondListViewTask(
                        checkedItems: checkedItems,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text('Next Page'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
