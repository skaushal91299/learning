import 'dart:convert';

class Info {
  String? seed;
  int? results;
  int? page;
  String? version;

  Info({this.seed, this.results, this.page, this.version});

  factory Info.fromMap(Map<String, dynamic> data) => Info(
        seed: data['seed'] as String?,
        results: data['results'] as int?,
        page: data['page'] as int?,
        version: data['version'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'seed': seed,
        'results': results,
        'page': page,
        'version': version,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Info].
  factory Info.fromJson(String data) {
    return Info.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Info] to a JSON string.
  String toJson() => json.encode(toMap());
}
