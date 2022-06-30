import 'dart:convert';

import 'picture.dart';

class Result {
  String? gender;
  String? email;
  Picture? picture;

  Result({this.gender, this.email, this.picture});

  factory Result.fromMap(Map<String, dynamic> data) => Result(
        gender: data['gender'] as String?,
        email: data['email'] as String?,
        picture: data['picture'] == null
            ? null
            : Picture.fromMap(data['picture'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'gender': gender,
        'email': email,
        'picture': picture?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory Result.fromJson(String data) {
    return Result.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());
}
