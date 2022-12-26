import 'dart:convert';

class Post {
  final String id;
  final String content;
  final String userID;
  DateTime date;
  int type;
  Post({
    required this.id,
    required this.content,
    required this.date,
    required this.type,
    required this.userID,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'userID': userID,
      'date': date.millisecondsSinceEpoch,
      'type': type,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as String,
      content: map['content'] as String,
      userID: map['userID'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      type: map['type'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
