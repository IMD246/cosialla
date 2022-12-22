// import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String id;
  String contents;
  String image;
  Timestamp date;
  dynamic loves = [];
  dynamic comments = [];
  int type;
  String user;
  Post({
    required this.id,
    required this.contents,
    required this.image,
    required this.date,
    required this.loves,
    required this.comments,
    required this.type,
    required this.user,
  });

  factory Post.fromJson(Map<dynamic, dynamic> json, String id) => Post(
      id: id,
      contents: json['contents'],
      image: json['image'],
      date: json['date_submit'],
      loves: json['loves'],
      comments: json['comments'],
      type: json['type'],
      user: json['user']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'contents': this.contents,
        'image': this.image,
        'date_submit': this.date,
        'loves': this.loves,
        'commnets': this.comments,
        'type': this.type,
        'user': this.user
      };

  factory Post.fromSnapshot(DocumentSnapshot snapshot) {
    Post newPost =
        Post.fromJson(snapshot.data() as Map<String, dynamic>, snapshot.id);
    return newPost;
  }
}
