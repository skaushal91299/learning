import 'dart:convert';

import 'dob.dart';
import 'id.dart';
import 'location.dart';
import 'login.dart';
import 'name.dart';
import 'picture.dart';
import 'registered.dart';

class Result {
  String? gender;
  Name? name;
  Location? location;
  String? email;
  Login? login;
  Dob? dob;
  Registered? registered;
  String? phone;
  String? cell;
  Id? id;
  Picture? picture;
  String? nat;

  Result({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  factory Result.fromMap(Map<String, dynamic> data) => Result(
        gender: data['gender'] as String?,
        name: data['name'] == null
            ? null
            : Name.fromMap(data['name'] as Map<String, dynamic>),
        location: data['location'] == null
            ? null
            : Location.fromMap(data['location'] as Map<String, dynamic>),
        email: data['email'] as String?,
        login: data['login'] == null
            ? null
            : Login.fromMap(data['login'] as Map<String, dynamic>),
        dob: data['dob'] == null
            ? null
            : Dob.fromMap(data['dob'] as Map<String, dynamic>),
        registered: data['registered'] == null
            ? null
            : Registered.fromMap(data['registered'] as Map<String, dynamic>),
        phone: data['phone'] as String?,
        cell: data['cell'] as String?,
        id: data['id'] == null
            ? null
            : Id.fromMap(data['id'] as Map<String, dynamic>),
        picture: data['picture'] == null
            ? null
            : Picture.fromMap(data['picture'] as Map<String, dynamic>),
        nat: data['nat'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'gender': gender,
        'name': name?.toMap(),
        'location': location?.toMap(),
        'email': email,
        'login': login?.toMap(),
        'dob': dob?.toMap(),
        'registered': registered?.toMap(),
        'phone': phone,
        'cell': cell,
        'id': id?.toMap(),
        'picture': picture?.toMap(),
        'nat': nat,
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
