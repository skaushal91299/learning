import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/screens/get_api_integretion/view/api_view.dart';

import 'screens/bottom_navigation/bottom_navbar.dart';
import 'screens/google_signIn/google_signin.dart';
import 'screens/rest_api_login/login_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttons(
                  () {
                    Get.to(() => const LoginView());
                  },
                  'Login with REST API',
                ),
                buttons(
                  () {
                    Get.to(() => const GoogleAuthPage());
                  },
                  'Google Sign in',
                ),
                buttons(
                  () {
                    Get.offAll(() => const BottomNavBarView());
                  },
                  'Bottom Navigation Bar',
                ),
                buttons(
                  () {
                    Get.offAll(() => const APIIntegration());
                  },
                  'API Integretion',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

GestureDetector buttons(
  pageRoute,
  text,
) {
  return GestureDetector(
    onTap: pageRoute,
    child: Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 104, 104, 104),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Text(text),
    ),
  );
}
