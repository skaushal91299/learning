// // ignore_for_file: library_private_types_in_public_api

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../Model/model_class.dart';
// import '../services/api_services.dart';

// class APIIntegration extends StatefulWidget {
//   const APIIntegration({Key? key}) : super(key: key);

//   @override
//   _APIIntegrationState createState() => _APIIntegrationState();
// }

// class _APIIntegrationState extends State<APIIntegration> {
//   Future<UserModel> fetchUser() async {
//     var response = await http.get(
//       Uri.parse('https://api.publicapis.org/entries'),
//     );
//     var data = jsonDecode(response.body.toString());
//     print(data);
//     if (response.statusCode == 200) {
//       return UserModel.fromJson(data);
//     } else {
//       return;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('REST API'),
//       ),
//       body: FutureBuilder<UserModel>(
//         future: fetchUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else {

//           }
//         },
//       ),
//     );
//   }
// }
