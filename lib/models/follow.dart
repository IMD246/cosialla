import 'package:cloud_firestore/cloud_firestore.dart';

class Follow {
  dynamic followers;
  dynamic following;
  Follow({required this.followers, required this.following});

  factory Follow.fromJson(Map<dynamic, dynamic> json) => Follow(
        followers: json['followers'],
        following: json['following'],
      );

  factory Follow.fromSnapshot(DocumentSnapshot snapshot) {
    Follow newComment =
        Follow.fromJson(snapshot.data() as Map<String, dynamic>);
    return newComment;
  }
}
