import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../initail_screen.dart';
import 'function.dart';

class GoogleLoginSuccess extends StatelessWidget {
  const GoogleLoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user!.email!),
              Text(user.displayName!),
              GestureDetector(
                  onTap: () async {
                    await signOut();
                    Get.to(() => const HomePage());
                  },
                  child: Container(
                    color: Colors.amber,
                    padding: const EdgeInsets.all(50),
                    child: const Text('SignOut'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
