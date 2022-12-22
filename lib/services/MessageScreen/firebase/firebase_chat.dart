// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:social_ui_kit/services/LoginScreen/firebase/firebase_user_presence.dart';
// import 'package:social_ui_kit/services/LoginScreen/firebase/firebase_user_profile.dart';
// import 'package:social_ui_kit/services/LoginScreen/models/user_presence.dart';
// import 'package:social_ui_kit/services/LoginScreen/models/user_profile.dart';
// import 'package:social_ui_kit/services/MessageScreen/constants/chat_constant_field.dart';
// import 'package:social_ui_kit/services/MessageScreen/constants/message_chat_field.dart';
// import 'package:social_ui_kit/services/MessageScreen/enum/enum.dart';
// import 'package:social_ui_kit/services/MessageScreen/firebase/firebase_chat_message.dart';
// import 'package:social_ui_kit/services/MessageScreen/models/chat.dart';

// class FirebaseChat {
//   final firebaseChat = FirebaseFirestore.instance.collection('chat');
//   Future<void> createChat({
//     required List<String> listUserID,
//   }) async {
//     final FirebaseChatMessage firebaseChatMessage = FirebaseChatMessage();
//     Map<String, dynamic> map = <String, dynamic>{
//       isActiveField: false,
//       lastTextField: 'Let make some chat!',
//       listUserField: listUserID,
//       timeLastChatField: DateTime.now(),
//       stampTimeField: DateTime.now(),
//     };
//     bool check1 = false;
//     check1 = await firebaseChat
//         .doc(listUserID[0] + listUserID[1])
//         .get()
//         .then((value) async {
//       if (value.exists) {
//         return true;
//       } else {
//         return await firebaseChat
//             .doc(listUserID[1] + listUserID[0])
//             .get()
//             .then((value) {
//           if (value.exists) {
//             return true;
//           } else {
//             return false;
//           }
//         });
//       }
//     });
//     if (check1 == false) {
//       await firebaseChat
//           .doc(listUserID[0] + listUserID[1])
//           .set(map)
//           .whenComplete(
//         () async {
//           await firebaseChatMessage.createFirstTextMessage(
//             chatID: listUserID[0] + listUserID[1],
//           );
//           await updateChatToActive(
//             listUserChatID: listUserID,
//             canUpdate: true,
//           );
//         },
//       );
//     }
//   }

//   Future<void> updateChatLastText({
//     required String text,
//     required TypeMessage typeMessage,
//     required String chatID,
//   }) async {
//     Map<String, dynamic> map = <String, dynamic>{
//       lastTextField: text,
//       typeMessageField: typeMessage.toString(),
//       timeLastChatField: DateTime.now(),
//     };
//     await firebaseChat.doc(chatID).update(map);
//   }

//   Future<void> updateChatToActive({
//     required List<String> listUserChatID,
//     required bool canUpdate,
//   }) async {
//     if (canUpdate) {
//       Map<String, dynamic> map = <String, dynamic>{
//         isActiveField: true,
//       };
//       final chat = await getChatByIDUsersJoined(
//         listUserChatID: listUserChatID,
//         userPresenceChat: null,
//         userProfileChat: null,
//         isInMessageScreen: false,
//       );
//       await firebaseChat.doc(chat.idChat).update(map);
//     }
//   }

//   Future<DocumentSnapshot<Map<String, dynamic>>?> getQueryDocumentSnapShotChat(
//       {required List<String> listUserChatID}) async {
//     final docChat = await firebaseChat
//         .doc(listUserChatID[0] + listUserChatID[1])
//         .get()
//         .then(
//       (value) async {
//         if (value.exists) {
//           return value;
//         } else {
//           return await firebaseChat
//               .doc(listUserChatID[1] + listUserChatID[0])
//               .get()
//               .then(
//             (value) {
//               if (value.exists) {
//                 return value;
//               } else {
//                 return null;
//               }
//             },
//           );
//         }
//       },
//     );
//     return docChat;
//   }

//   Future<Chat> getChatByID({
//     required String idChat,
//     required String userChatID,
//   }) async {
//     final chat = await firebaseChat.doc(idChat).get();
//     final firebaseUserPresence = FirebaseUserPresence();
//     final firebaseUserProfile = FirebaseUserProfile();
//     final userPresence =
//         await firebaseUserPresence.getUserPresence(userID: userChatID);
//     final userProfile = await firebaseUserProfile.getUserProfile(userChatID);
//     return Chat.fromSnapshot(
//       docs: chat,
//       userPresence: userPresence,
//       userProfile: userProfile,
//     );
//   }

//   Future<Chat> getChatByIDUsersJoined({
//     required List<String> listUserChatID,
//     required UserPresence? userPresenceChat,
//     required UserProfile? userProfileChat,
//     required bool isInMessageScreen,
//   }) async {
//     final docChat =
//         await getQueryDocumentSnapShotChat(listUserChatID: listUserChatID);
//     if (isInMessageScreen) {
//       return Chat.fromSnapshot(
//         docs: docChat!,
//         userPresence: userPresenceChat,
//         userProfile: userProfileChat,
//       );
//     } else {
//       return Chat.fromSnapshot(
//         docs: docChat!,
//         userPresence: userPresenceChat,
//         userProfile: userProfileChat,
//       );
//     }
//   }

//   Future<Chat> updateChatUserProfile({
//     required Chat chat,
//     required String ownerUserID,
//   }) async {
//     int count = 0;
//     chat.listUser.forEach(
//       (element) {
//         if (count >= 2) {
//           return;
//         }
//         if (ownerUserID == element) {
//           count++;
//         }
//       },
//     );
//     String idUserFriendChat = ownerUserID;
//     if (count < 2) {
//       idUserFriendChat = chat.listUser
//           .where(
//             (element) => element != ownerUserID,
//           )
//           .first;
//     }
//     final firebaseUserProfile = FirebaseUserProfile();
//     final firebaseUserPresence = FirebaseUserPresence();
//     final firebaseChatMessage = FirebaseChatMessage();
//     final chatMessage = await firebaseChatMessage.getLastMessageOfAChat(
//         chatID: chat.idChat, ownerUserID: ownerUserID);
//     final userProfile =
//         await firebaseUserProfile.getUserProfile(idUserFriendChat);
//     final userPresence =
//         await firebaseUserPresence.getUserPresence(userID: idUserFriendChat);
//     chat.nameChat = userProfile!.fullName;
//     chat.presenceUserChat = userPresence.presence;
//     chat.stampTimeUser = userPresence.stampTime;
//     chat.urlImage = userProfile.urlImage;
//     if (chatMessage!.userID != null && chatMessage.userID == ownerUserID) {
//       chat.lastText = "You: " + chat.lastText;
//     } else {
//       chat.lastText = chat.lastText;
//     }
//     return chat;
//   }

//   Future<Iterable<Future<Chat>>?> getAllChat({
//     required String ownerUserID,
//   }) async {
//     // return firebaseChat
//     //     .where(listUserField, arrayContains: ownerUserID)
//     //     .where(isActiveField, isEqualTo: true)
//     //     .orderBy(timeLastChatField, descending: true)
//     //     .snapshots()
//     //     .map(
//     //   (event) {
//     //     if (event.docs.isNotEmpty) {
//     //       return event.docs.map(
//     //         (e) {
//     //           return Chat.fromSnapshot(
//     //             docs: e,
//     //             userPresence: null,
//     //             userProfile: null,
//     //           );
//     //         },
//     //       );
//     //     } else {
//     //       return null;
//     //     }
//     //   },
//     // );
//     final list = await firebaseChat
//         .where(listUserField, arrayContains: ownerUserID)
//         .where(isActiveField, isEqualTo: true)
//         .orderBy(timeLastChatField, descending: true)
//         .get()
//         .then(
//       (value) {
//         if (value.docs.isNotEmpty) {
//           return value.docs.map(
//             (e) async {
//               Chat chat = Chat.fromSnapshot(
//                 docs: e,
//                 userPresence: null,
//                 userProfile: null,
//               );
//               chat = await updateChatUserProfile(
//                 chat: chat,
//                 ownerUserID: ownerUserID,
//               );
//               return chat;
//             },
//           );
//         } else {
//           return null;
//         }
//       },
//     );
//     return list;
//     //   },
//     //     })
//     //     .snapshots()
//     //     .map(
//     //   (event) {
//     //     if (event.docs.isNotEmpty) {
//     //       return event.docs.map(
//     //         (e) {
//     //           return Chat.fromSnapshot(
//     //             docs: e,
//     //             userPresence: null,
//     //             userProfile: null,
//     //           );
//     //         },
//     //       );
//     //     } else {
//     //       return null;
//     //     }
//     //   },
//     // );
//   }
// }
