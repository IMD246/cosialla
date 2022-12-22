import 'dart:convert';

class UserPresence {
  final DateTime stampTime;
  bool presence = false;
  UserPresence(
    this.stampTime,
    this.presence,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stampTime': stampTime.millisecondsSinceEpoch,
      'presence': presence,
    };
  }

  factory UserPresence.fromMap(Map<String, dynamic> map) {
    return UserPresence(
      DateTime.fromMillisecondsSinceEpoch(map['stampTime'] as int),
      map['presence'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPresence.fromJson(String source) =>
      UserPresence.fromMap(json.decode(source) as Map<String, dynamic>);
}
