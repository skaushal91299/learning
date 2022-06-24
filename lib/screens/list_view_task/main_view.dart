import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learning/screens/list_view_task/second_view.dart';

class ListViewTask extends StatefulWidget {
  const ListViewTask({Key? key}) : super(key: key);

  @override
  State<ListViewTask> createState() => _ListViewTaskState();
}

class _ListViewTaskState extends State<ListViewTask> {
  static const int _count = 10;
  final List<bool> _checks = List.generate(_count, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Checkbox(
                            value: _checks[i],
                            onChanged: (val) {
                              setState(() {
                                _checks[i] = val!;
                              });
                              print(_checks[i]);
                              print(val);
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
                    () => const SecondListViewTask(),
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
    );
  }
}
