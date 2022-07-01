import 'package:flutter/material.dart';

import 'signup.dart';

class LoginViewSiginGetX extends StatelessWidget {
  const LoginViewSiginGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Sign In'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    TextFormFields(
                        controller: authController.emailController,
                        icon: Icons.email,
                        labelText: 'E-Mail'),
                    const SizedBox(height: 20),
                    TextFormFields(
                        controller: authController.pswdController,
                        icon: Icons.lock,
                        labelText: 'Password'),
                  ],
                ),
              ),
              Buttons(labelText: 'LOGIN'),
            ],
          ),
        ),
      ),
    );
  }
}
