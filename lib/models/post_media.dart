import 'dart:convert';

class PostMedia {
  final String? id;
  final String nameFile;
  String? url;
  final String type;
  final DateTime stampTime;
  PostMedia( {
    this.id,
    this.url,
    required this.type,
    required this.nameFile,
    required this.stampTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name_file': nameFile,
      'url': url,
      'type': type,
      'stampTime': stampTime.millisecondsSinceEpoch,
    };
  }

  factory PostMedia.fromMap(Map<String, dynamic> map) {
    return PostMedia(
      nameFile: map['name_file'] as String,
      url: map['url'] != null ? map['url'] as String : null,
      type: map['type'] as String,
      stampTime: DateTime.fromMillisecondsSinceEpoch(map['stampTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostMedia.fromJson(String source) => PostMedia.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
