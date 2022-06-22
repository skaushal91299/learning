import 'package:flutter/material.dart';

class SecondScrren extends StatelessWidget {
  const SecondScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: const Text('SCREEN 2')),
      color: Colors.green,
    );
  }
}
