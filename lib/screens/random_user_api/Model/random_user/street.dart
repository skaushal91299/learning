import 'dart:convert';

class Street {
  int? number;
  String? name;

  Street({this.number, this.name});

  factory Street.fromMap(Map<String, dynamic> data) => Street(
        number: data['number'] as int?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'number': number,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Street].
  factory Street.fromJson(String data) {
    return Street.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Street] to a JSON string.
  String toJson() => json.encode(toMap());
}
