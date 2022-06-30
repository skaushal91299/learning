import 'dart:convert';

import 'entry.dart';

class Enteries {
  int? count;
  List<Entry>? entries;

  Enteries({this.count, this.entries});

  @override
  String toString() => 'Enteries(count: $count, entries: $entries)';

  factory Enteries.fromMap(Map<String, dynamic> data) => Enteries(
        count: data['count'],
        entries: data['entries']
            ?.map((e) => Entry.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'count': count,
        'entries': entries?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Enteries].
  factory Enteries.fromJson(String data) {
    return Enteries.fromMap(jsonDecode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Enteries] to a JSON string.
  String toJson() => json.encode(toMap());
}
