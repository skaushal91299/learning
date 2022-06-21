import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/views/ecom_ui/ecom_ui.dart';
import 'package:learning/views/rest_api_login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buttons(
                  () {
                    Get.to(() => LoginView());
                  },
                  'Login with REST API',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buttons(
    pageRoute,
    text,
  ) {
    return GestureDetector(
      onTap: pageRoute,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 104, 104, 104),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Text(text),
      ),
    );
  }
}
