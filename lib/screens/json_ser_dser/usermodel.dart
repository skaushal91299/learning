// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModelTest {
  // Default Constructor
  UserModelTest({
    required this.id,
    required this.fullName,
    required this.email,
  });

  // Named Constructor (For Deserialization)
  // (MAP TO OBJECT)
  UserModelTest.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    fullName = map["fullName"];
    email = map["email"];
  }

  late String email;
  late String fullName;
  late String id;

  // Object to Map (For Serialization)
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
    };
  }
}
