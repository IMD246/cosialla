
// import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String contents;
  Timestamp date;
  String user;
  Comment({
    required this.contents,
    required this.date,
    required this.user,
  });

  factory Comment.fromJson(Map<dynamic, dynamic> json) => Comment(
      contents: json['contents'],
      date: json['date'],
      user: json['user']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'contents': this.contents,
        'date': this.date,
        'user': this.user
      };

  factory Comment.fromSnapshot(DocumentSnapshot snapshot) {
    Comment newComment = Comment.fromJson(snapshot.data() as Map<String, dynamic>);
    return newComment;
  }
}
