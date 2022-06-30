import 'dart:convert';

class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  factory Picture.fromMap(Map<String, dynamic> data) => Picture(
        large: data['large'] as String?,
        medium: data['medium'] as String?,
        thumbnail: data['thumbnail'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'large': large,
        'medium': medium,
        'thumbnail': thumbnail,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Picture].
  factory Picture.fromJson(String data) {
    return Picture.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Picture] to a JSON string.
  String toJson() => json.encode(toMap());
}
