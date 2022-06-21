// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/views/google_signIn/function.dart';

import 'google_home.dart';

class GoogleAuthPage extends StatefulWidget {
  const GoogleAuthPage({Key? key}) : super(key: key);

  @override
  State<GoogleAuthPage> createState() => _GoogleAuthPageState();
}

class _GoogleAuthPageState extends State<GoogleAuthPage> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () async {
              setState(() {
                isLoading = true;
              });
              try {
                await signInWithGoogle();
                Get.to(
                  () => const GoogleLoginSuccess(),
                );
              } catch (e) {
                print(e.toString());
              }
              setState(() {
                isLoading = false;
              });
            },
            child: Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(10),
              child: const Text('Google SignIn Button'),
            ),
          ),
        ),
      ),
    );
  }
}
