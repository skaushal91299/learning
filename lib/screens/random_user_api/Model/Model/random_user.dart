import 'results.dart';

class RandomUser {
  List<Results>? results;
  RandomUser({
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'results': results!.map((x) => x.toMap()).toList(),
    };
  }

  RandomUser.fromMap(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromMap(v));
      });
    }
  }
}
