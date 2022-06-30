import 'dart:convert';

class Dob {
  DateTime? date;
  int? age;

  Dob({this.date, this.age});

  factory Dob.fromMap(Map<String, dynamic> data) => Dob(
        date: data['date'] == null
            ? null
            : DateTime.parse(data['date'] as String),
        age: data['age'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'date': date?.toIso8601String(),
        'age': age,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Dob].
  factory Dob.fromJson(String data) {
    return Dob.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Dob] to a JSON string.
  String toJson() => json.encode(toMap());
}
