// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_pref_view.dart';

String? finalEmail;

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    getValidationData().whenComplete(() async {
      Timer(
        const Duration(
          seconds: 2,
        ),
        () => Get.off(
          finalEmail == null ? const SharedPrefTut() : const Home(),
        ),
      );
    });
    super.initState();
  }

  Future getValidationData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var obtainedEmail = pref.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Text('Loading'),
          ],
        ),
      )),
    );
  }
}
