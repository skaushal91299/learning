import 'dart:convert';

class Timezone {
  String? offset;
  String? description;

  Timezone({this.offset, this.description});

  factory Timezone.fromMap(Map<String, dynamic> data) => Timezone(
        offset: data['offset'] as String?,
        description: data['description'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'offset': offset,
        'description': description,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Timezone].
  factory Timezone.fromJson(String data) {
    return Timezone.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Timezone] to a JSON string.
  String toJson() => json.encode(toMap());
}
