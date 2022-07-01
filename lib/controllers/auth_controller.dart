import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learning/utils/app_constant.dart';

import '../views/rest_api_login/login_success.dart';

class AuthController extends GetxController {
  TextEditingController confirmPswdController = TextEditingController();
  TextEditingController deviceTypeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // Form Key
  final globalKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController pswdController = TextEditingController();

  // Sign Up User
  Future<dynamic> signUp(String email, String phoneNumber, String password,
      String deviceType) async {
    try {
      var url = Uri.parse(
          'https://php.parastechnologies.in/groupthnk/api/create/Account');
      var response = await http.post(
        url,
        body: {
          'email': email,
          'phoneNumber': phoneNumber,
          'password': password,
          'deviceType': deviceType,
          'deviceToken': 'jkgjskjgsjg',
        },
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        print(' Data $data');
        if (data["success"] != 0) {
          snackBar('Login successfully');
          return Get.to(() => const LoginSuccess());
        } else {
          print('success');
          print(data['success']);
        }
      } else {
        Get.snackbar(
          'Error',
          "Internal server error",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          icon: const Icon(Icons.dangerous),
          backgroundColor: const Color.fromARGB(255, 242, 74, 63),
        );
        print('success');
        print(data['success']);
      }
    } catch (e) {
      print(e.toString());
    }
  }

// Sign In User
  Future<dynamic> signIn(
      String email, String password, String deviceType) async {
    try {
      var url = Uri.parse(AppConstants.BASE_URL + AppConstants.LOGIN);
      var response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
          'deviceType': deviceType,
          'deviceToken': 'jkgjskjgsjg',
        },
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        print(' Data $data');
        if (data["success"] != 0) {
          snackBar('Login successfully');
          return Get.to(() => const LoginSuccess());
        } else {
          print('success');
          print(data['message']);
        }
      } else {
        Get.snackbar(
          'Error',
          "Internal server error",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          icon: const Icon(Icons.dangerous),
          backgroundColor: const Color.fromARGB(255, 242, 74, 63),
        );
        print('success');
        print(data['success']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

snackBar(
  String message,
) {
  Get.snackbar(
    'Error',
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.black,
    backgroundColor: const Color.fromRGBO(240, 148, 51, 1),
    icon: const Icon(Icons.dangerous),
    duration: const Duration(seconds: 1),
    animationDuration: const Duration(seconds: 1),
  );
}
