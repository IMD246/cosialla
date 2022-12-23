// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserProfile {
  final String id;
  final String email;
  final String fullName;
  String? urlImage;
  String? messagingToken;
  bool isEmailVerified;
  UserProfile({
    required this.id,
    required this.email,
    required this.fullName,
    this.urlImage,
    this.messagingToken,
    required this.isEmailVerified,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_user': id,
      'email': email,
      'full_name': fullName,
      'url_image': urlImage,
      'user_messaging_token': messagingToken,
      'is_email_verified': isEmailVerified
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id_user'] as String,
      email: map['email'] as String,
      fullName: map['full_name'] as String,
      urlImage: map['url_image'] != null ? map['url_image'] as String : null,
      messagingToken: map['user_messaging_token'] != null
          ? map['user_messaging_token'] as String
          : null,
      isEmailVerified: map['is_email_verified'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source) as Map<String, dynamic>);
}
