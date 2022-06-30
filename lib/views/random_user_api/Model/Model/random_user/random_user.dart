import 'dart:convert';

import 'result.dart';

class RandomUser {
  List<Result>? results;

  RandomUser({this.results});

  factory RandomUser.fromMap(Map<String, dynamic> data) => RandomUser(
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RandomUser].
  factory RandomUser.fromJson(String data) {
    return RandomUser.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RandomUser] to a JSON string.
  String toJson() => json.encode(toMap());
}
