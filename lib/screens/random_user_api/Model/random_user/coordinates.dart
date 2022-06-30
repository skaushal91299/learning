import 'dart:convert';

class Coordinates {
  String? latitude;
  String? longitude;

  Coordinates({this.latitude, this.longitude});

  factory Coordinates.fromMap(Map<String, dynamic> data) => Coordinates(
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'latitude': latitude,
        'longitude': longitude,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Coordinates].
  factory Coordinates.fromJson(String data) {
    return Coordinates.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Coordinates] to a JSON string.
  String toJson() => json.encode(toMap());
}
