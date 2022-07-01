// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:learning/controllers/auth_controller.dart';

AuthController authController = Get.put(AuthController());

class LoginViewGetX extends StatelessWidget {
  const LoginViewGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    signIn() {
      authController.globalKey.currentState!.validate();
      authController.signIn(
        authController.emailController.text.trim(),
        authController.pswdController.text.trim(),
        'Android',
      );
      print('Login Button Clicked');
      print(authController.emailController.text.trim());
      print(authController.pswdController.text.trim());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registeration Page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Form(
            key: authController.globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Sign In'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    TextFormFields(
                        validator: (value) {
                          if (authController.emailController.text
                              .trim()
                              .isEmail) {
                            return null;
                          } else if (authController.emailController.text
                              .trim()
                              .isEmpty) {
                            return 'E-Mail can\'t be Empty!!';
                          }
                          return 'Please Enter Valid E-Mail';
                        },
                        textInputAction: TextInputAction.next,
                        controller: authController.emailController,
                        icon: Icons.email,
                        labelText: 'E-Mail'),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormFields(
                        validator: (value) {
                          if (authController.pswdController.text
                              .trim()
                              .isEmpty) {
                            return 'Password can\'t be Empty!!';
                          } else if (authController.pswdController.text
                                  .trim()
                                  .length <=
                              5) {
                            return 'Paswword Length should be minimum 6 digit';
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        controller: authController.pswdController,
                        icon: Icons.lock,
                        labelText: 'Password'),
                  ],
                ),
                Buttons(
                  labelText: 'LOGIN',
                  onTap: signIn(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  Buttons({
    super.key,
    this.labelText,
    this.onTap,
  });

  String? labelText;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Get.width * 0.2,
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.center,
        width: Get.width,
        height: Get.height * 0.07,
        child: Text(
          labelText!.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TextFormFields extends StatelessWidget {
  TextFormFields({
    Key? key,
    this.labelText,
    this.icon,
    this.controller,
    this.textInputAction,
    this.validator,
  }) : super(key: key);

  TextEditingController? controller;
  dynamic icon;
  String? labelText;
  dynamic textInputAction;
  dynamic validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        prefixIcon: Icon(icon),
        labelText: labelText,
        // hintText: 'First Name'
      ),
    );
  }
}
