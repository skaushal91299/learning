// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondListViewTask extends StatefulWidget {
  SecondListViewTask({
    Key? key,
    required this.checkedItems,
  }) : super(
          key: key,
        );

  List<dynamic> checkedItems;

  @override
  State<SecondListViewTask> createState() => _SecondListViewTaskState();
}

class _SecondListViewTaskState extends State<SecondListViewTask> {
  final _count = 10;
  // List<dynamic>? checkedItemsCheck=List.generate(1, (index) {
  //   if(widget.checkedItems==null){}
  // });
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    print(widget.checkedItems);
    super.initState();
  }

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
                            value: widget.checkedItems.contains(i),
                            onChanged: (val) {},
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
