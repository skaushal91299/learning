import 'dart:convert';

import 'entry.dart';

class Api {
  int? count;
  List<Entry>? entries;

  Api({this.count, this.entries});

  factory Api.fromMap(Map<String, dynamic> data) => Api(
        count: data['count'] as int?,
        entries: (data['entries'] as List<dynamic>?)
            ?.map((e) => Entry.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'count': count,
        'entries': entries?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Api].
  factory Api.fromJson(String data) {
    return Api.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Api] to a JSON string.
  String toJson() => json.encode(toMap());
}
