import 'dart:convert';

class Name {
  String? title;
  String? first;
  String? last;

  Name({this.title, this.first, this.last});

  factory Name.fromMap(Map<String, dynamic> data) => Name(
        title: data['title'] as String?,
        first: data['first'] as String?,
        last: data['last'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'first': first,
        'last': last,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Name].
  factory Name.fromJson(String data) {
    return Name.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Name] to a JSON string.
  String toJson() => json.encode(toMap());
}
