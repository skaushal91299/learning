import 'dart:convert';

class Login {
  String? uuid;
  String? username;
  String? password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  Login({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  factory Login.fromMap(Map<String, dynamic> data) => Login(
        uuid: data['uuid'] as String?,
        username: data['username'] as String?,
        password: data['password'] as String?,
        salt: data['salt'] as String?,
        md5: data['md5'] as String?,
        sha1: data['sha1'] as String?,
        sha256: data['sha256'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'uuid': uuid,
        'username': username,
        'password': password,
        'salt': salt,
        'md5': md5,
        'sha1': sha1,
        'sha256': sha256,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Login].
  factory Login.fromJson(String data) {
    return Login.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Login] to a JSON string.
  String toJson() => json.encode(toMap());
}
