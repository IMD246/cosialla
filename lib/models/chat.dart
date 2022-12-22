import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/MessageScreen/constants/chat_constant_field.dart';
import '../services/MessageScreen/constants/message_chat_field.dart';
import '../services/MessageScreen/enum/enum.dart';
import 'user_presence.dart';
import 'user_profile.dart';

class Chat {
  final String idChat;
  final DateTime stampTime;
  final DateTime stampTimeChat;
  String lastText;
  String nameChat = "";
  String? urlImage;
  String? time;
  bool presenceUserChat = false;
  DateTime stampTimeUser;
  final bool isActive;
  final TypeMessage typeMessage;
  List<String> listUser = [];
  Chat({
    required this.typeMessage,
    required this.isActive,
    required this.idChat,
    required this.stampTime,
    required this.lastText,
    required this.nameChat,
    required this.urlImage,
    required this.presenceUserChat,
    required this.stampTimeChat,
    this.time,
    required this.stampTimeUser,
    required this.listUser,
  });
  factory Chat.fromSnapshot({
    required DocumentSnapshot<Map<String, dynamic>> docs,
    required UserProfile? userProfile,
    required UserPresence? userPresence,
  }) =>
      Chat(
        idChat: docs.id,
        stampTime: docs.data()?[timeLastChatField] != null
            ? docs.get(timeLastChatField).toDate()
            : DateTime.now(),
        nameChat: userProfile?.fullName ?? "",
        lastText: docs.get(lastTextField),
        listUser: List<String>.from(
          docs.get(listUserField) as List,
        ),
        stampTimeChat: docs.get(stampTimeField).toDate(),
        isActive: docs.get(isActiveField),
        typeMessage: docs.data()?[typeMessageField] != null
            ? getTypeMessage(value: docs.get(typeMessageField).toString())
            : TypeMessage.text,
        urlImage:"",
        presenceUserChat: userPresence?.presence ?? false,
        stampTimeUser: userPresence?.stampTime ?? DateTime.now(),
      );
}

TypeMessage getTypeMessage({required String value}) {
  if (value.toString().compareTo(TypeMessage.audio.toString()) == 0) {
    return TypeMessage.audio;
  } else if (value.toString().compareTo(TypeMessage.image.toString()) == 0) {
    return TypeMessage.image;
  } else if (value.toString().compareTo(TypeMessage.text.toString()) == 0) {
    return TypeMessage.text;
  } else {
    return TypeMessage.like;
  }
}
