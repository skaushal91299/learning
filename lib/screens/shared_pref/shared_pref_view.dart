import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/screens/shared_pref/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../initail_screen.dart';

class SharedPrefTut extends StatefulWidget {
  const SharedPrefTut({Key? key}) : super(key: key);

  @override
  State<SharedPrefTut> createState() => _SharedPrefTutState();
}

class _SharedPrefTutState extends State<SharedPrefTut> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//  Saving Text
  // void saveText(String text) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString("text", text);
  // }

  // // Fetch Text
  // void fetchText() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? savedValue = pref.getString("text");
  //   if (savedValue != null) {
  //     emailController.text = savedValue;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: emailController,
              // onChanged: (val) {
              //   saveText(val);
              // },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.yellow,
                )),
                labelText: 'E-Mail',
                hintText: 'Please Enter Your E-Mail',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.yellow,
                )),
                labelText: 'Password',
                hintText: 'Please Enter Your Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString('email', emailController.text);
                Get.off(() => const Home());
              },
              child: const Text('LOGIN'),
            )
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello $finalEmail'),
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.remove('email');
                  Get.off(() => const SharedPrefTut());
                },
                child: Text('Logout'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.off(() => const HomePage());
                },
                child: Text('HOME'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
