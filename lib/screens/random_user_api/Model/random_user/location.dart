import 'dart:convert';

import 'coordinates.dart';
import 'street.dart';
import 'timezone.dart';

class Location {
  Street? street;
  String? city;
  String? state;
  String? country;
  int? postcode;
  Coordinates? coordinates;
  Timezone? timezone;

  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });

  factory Location.fromMap(Map<String, dynamic> data) => Location(
        street: data['street'] == null
            ? null
            : Street.fromMap(data['street'] as Map<String, dynamic>),
        city: data['city'] as String?,
        state: data['state'] as String?,
        country: data['country'] as String?,
        postcode: data['postcode'] as int?,
        coordinates: data['coordinates'] == null
            ? null
            : Coordinates.fromMap(data['coordinates'] as Map<String, dynamic>),
        timezone: data['timezone'] == null
            ? null
            : Timezone.fromMap(data['timezone'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'street': street?.toMap(),
        'city': city,
        'state': state,
        'country': country,
        'postcode': postcode,
        'coordinates': coordinates?.toMap(),
        'timezone': timezone?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Location].
  factory Location.fromJson(String data) {
    return Location.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Location] to a JSON string.
  String toJson() => json.encode(toMap());
}
