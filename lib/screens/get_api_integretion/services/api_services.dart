import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/model_class.dart';

class ApiService {
  String website = "https://jsonplaceholder.typicode.com/users";
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(website);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // List<UserModel> _model =
        //     userModelFromJson(response.body) as List<UserModel>;
        // return _model;
        print(response);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
