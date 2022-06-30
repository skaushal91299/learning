// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Model/model_class.dart';

class ApiService {
  String website = "https://jsonplaceholder.typicode.com/users";
  Future<dynamic> getUsers() async {
    try {
      var url = Uri.parse(website);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        UserModel model = UserModel.fromJson(jsonDecode(response.body));
        print(model.count);
        print(model.entries!.length);
        // List<UserModel> _model =
        //     userModelFromJson(response.body) as List<UserModel>;
        // return _model;
        print(response);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    // return null;
  }
}
