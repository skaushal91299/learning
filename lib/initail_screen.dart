import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/views/api_login_signup/signup.dart';
import '/views/json_ser_dser/json_ser_des.dart';
import '/views/list_view_task/main_view.dart';
import '/views/shared_pref/splash_screen.dart';
import '/views/tab_bar/main_view.dart';
import '/views/test_api/view/api_view.dart';
import 'views/api_login_signup/login.dart';
import 'views/bottom_navigation/bottom_navbar.dart';
import 'views/google_signIn/google_signin.dart';
import 'views/random_user_api/view/api_view.dart';
import 'views/rest_api_login/login_view.dart';

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
                    Get.offAll(() => const ApiView());
                  },
                  'API Integretion',
                ),
                buttons(
                  () {
                    Get.offAll(() => const ApiProfileView());
                  },
                  'Random User',
                ),
                buttons(
                  () {
                    Get.offAll(() => const JSONDeSer());
                  },
                  'JSON SERIAL DESE',
                ),
                buttons(
                  () {
                    Get.offAll(() => const SplashScreen());
                  },
                  'Shared Pref',
                ),
                buttons(
                  () {
                    Get.offAll(() => const TABBarView());
                  },
                  'Tab Bar',
                ),
                buttons(
                  () {
                    Get.offAll(() => const ListViewTask());
                  },
                  'ListView Builder with CheckBox',
                ),
                buttons(
                  () {
                    Get.offAll(() => const LoginGetX());
                  },
                  'Register using GetX',
                ),
                buttons(
                  () {
                    Get.offAll(() => const LoginViewSiginGetX());
                  },
                  'Login using GetX',
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
