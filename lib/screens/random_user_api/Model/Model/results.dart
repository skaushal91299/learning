// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'pictures.dart';

class Results {
  Results({
    this.gender,
    this.email,
    this.pictures,
  });

  Results.fromMap(Map<String, dynamic> map) {
    gender:
    map['gender'];
    email:
    map['email'];
    pictures:
    Picture.fromMap(map['picture']);
  }

  String? email;
  String? gender;
  Picture? pictures;

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'email': email,
      'pictures': pictures,
    };
  }
}
