import 'package:flutter/material.dart';

class FirstScrren extends StatelessWidget {
  const FirstScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amberAccent,
        child: const Center(child: Text('SCREEN 1')));
  }
}
