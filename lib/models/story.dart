// import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Story {
  String id;
  String contents;
  String image;
  Timestamp date;
  dynamic loves = [];
  String user;
  Story({
    required this.id,
    required this.contents,
    required this.image,
    required this.date,
    required this.loves,
    required this.user,
  });

  factory Story.fromJson(Map<dynamic, dynamic> json,String id) => Story(
      id: id,
      contents: json['content'],
      image: json['image'],
      date: json['date'],
      loves: json['loves'],
      user: json['user']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'content': this.contents,
        'image': this.image,
        'date': this.date,
        'loves': this.loves,
        'user': this.user
      };

  factory Story.fromSnapshot(DocumentSnapshot snapshot) {
    Story newStory = Story.fromJson(snapshot.data() as Map<String, dynamic>,snapshot.id);
    return newStory;
  }
}
