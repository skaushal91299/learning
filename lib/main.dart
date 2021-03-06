import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'initail_screen.dart';
import 'views/google_signIn/google_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;

    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: result == null ? const HomePage() : const GoogleLoginSuccess(),
    );
  }
}
