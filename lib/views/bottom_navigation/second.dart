import 'package:flutter/material.dart';

class SecondScrren extends StatelessWidget {
  const SecondScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(child: Text('SCREEN 2')),
    );
  }
}
