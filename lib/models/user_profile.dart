import 'dart:convert';

class UserProfile {
  final String id;
  final String email;
  final String fullName;
  UserProfile({
    required this.id,
    required this.email,
    required this.fullName,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'full_name': fullName,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] as String,
      email: map['email'] as String,
      fullName: map['full_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source) as Map<String, dynamic>);
}
