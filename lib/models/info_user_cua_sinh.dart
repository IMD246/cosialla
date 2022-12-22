import 'package:cloud_firestore/cloud_firestore.dart';

class InfoUserCuaSinh {
  final String id;
  final String email;
  final String fullName;
  // final int posts;
  // final int followers;
  // final int following;
  // final bool isDarkMode;
  final String urlImage;
  // final String token;
  InfoUserCuaSinh({
    required this.id,
    required this.email,
    required this.fullName,
    // required this.posts,
    // required this.followers,
    // required this.following,
    // required this.isDarkMode,
    required this.urlImage,
    // required this.token,
  });

  factory InfoUserCuaSinh.fromJson(Map<dynamic, dynamic> json, String id) =>
      InfoUserCuaSinh(
        id: id,
        email: json['email'],
        fullName: json['full_name'],
        // posts: json[''],
        urlImage: json['url_image'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'full_name': fullName,
        'url_image': urlImage,
      };

  factory InfoUserCuaSinh.fromSnapshot(DocumentSnapshot snapshot) {
    InfoUserCuaSinh newUser = InfoUserCuaSinh.fromJson(
        snapshot.data() as Map<String, dynamic>, snapshot.id);
    return newUser;
  }
}
