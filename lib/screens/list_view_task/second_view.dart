import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SecondListViewTask extends StatefulWidget {
  const SecondListViewTask({Key? key}) : super(key: key);

  @override
  State<SecondListViewTask> createState() => _SecondListViewTaskState();
}

class _SecondListViewTaskState extends State<SecondListViewTask> {
  static const int _count = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                          color: Colors.red,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Checkbox(
                              // value: _checks[i],
                              // onChanged: () {},
                              ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
