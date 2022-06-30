import 'dart:convert';

class Id {
  String? name;
  String? value;

  Id({this.name, this.value});

  factory Id.fromMap(Map<String, dynamic> data) => Id(
        name: data['name'] as String?,
        value: data['value'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Id].
  factory Id.fromJson(String data) {
    return Id.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Id] to a JSON string.
  String toJson() => json.encode(toMap());
}
