import 'dart:convert';

import 'package:flutter/material.dart';

import 'usermodel.dart';

class JSONDeSer extends StatefulWidget {
  JSONDeSer({Key? key}) : super(key: key);

  @override
  State<JSONDeSer> createState() => _JSONDeSerState();
}

class _JSONDeSerState extends State<JSONDeSer> {
  // User Object
  UserModelTest userObject = UserModelTest(
    id: '001',
    email: 'Skaushal91299@gmail.com',
    fullName: 'Sahil Kaushal',
  );

  String userJson =
      '{"id": "001",    "email": "Skaushal91299@gmail.com",    "fullName": "Sahil Kaushal"  }';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // conver user model to map
                Map<String, dynamic> userMap = userObject.toMap();
                // Json Encode
                var json = jsonEncode(userMap);
                print(json.toString());
              },
              child: Text('Serialize'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                var decoded = jsonDecode(userJson);
                Map<String, dynamic> userMap = decoded;
                UserModelTest newUser = UserModelTest.fromMap(userMap);
                print(userMap.toString());
              },
              child: Text('De-Serialize'),
            )
          ],
        ),
      ),
    );
  }
}
