// // ignore_for_file: unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// import '../../../constants/constants.dart';
// import '../../../models/chat.dart';
// import '../../../models/user_profile.dart';
// import '../../../services/LoginScreen/firebase/firebase_user_profile.dart';
// import '../../../services/MessageScreen/firebase/firebase_chat_message.dart';

// class SendMessage extends StatefulWidget {
//   const SendMessage({
//     Key? key,
//     required this.textController,
//     required this.ownerUserProfile,
//     required this.chat,
//     required this.scroll,
//   }) : super(key: key);

//   final TextEditingController textController;
//   final UserProfile ownerUserProfile;
//   final Chat chat;
//   final ItemScrollController scroll;
//   @override
//   State<SendMessage> createState() => _SendMessageState();
// }

// class _SendMessageState extends State<SendMessage> {
//   late final FirebaseUserProfile firebaseUserProfile;
//   late final FirebaseChatMessage firebaseChatMessage;
//   @override
//   void initState() {
//     firebaseUserProfile = FirebaseUserProfile();
//     firebaseChatMessage = FirebaseChatMessage();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     if (widget.textController.text.isNotEmpty) {
//       return IconButton(
//         onPressed: () async {
//           String message = widget.textController.text;
//           setState(
//             () {
//               firebaseChatMessage.deleteMessageNotSent(
//                 ownerUserID: widget.ownerUserProfile.id,
//                 chatID: widget.chat.idChat,
//               );
//               firebaseChatMessage.updateTextMessageNotSent(
//                 chat: widget.chat,
//                 text: widget.textController.text,
//                 ownerUserID: widget.ownerUserProfile.id,
//               );
//               if (widget.scroll.isAttached) {
//                 widget.scroll.scrollTo(
//                   index: intMaxValue,
//                   duration: const Duration(seconds: 3),
//                   curve: Curves.easeIn,
//                 );
//               }
//               widget.textController.clear();
//             },
//           );
//           // Push notification to others in chat
//           // String userIDFriend =
//           //     handleListUserIDChat(widget.chat, widget.ownerUserProfile);
//           String userIDFriend = "";
//           final ownerUserID = widget.ownerUserProfile.id;
//           if (userIDFriend.compareTo(ownerUserID) != 0) {
//             final userProfile = widget.ownerUserProfile;
//             final userProfileFriend = await firebaseUserProfile.getUserProfile(
//               userIDFriend,
//             );
//             final urlImage = userProfile.urlImage.isNotEmpty
//                 ? userProfile.urlImage
//                 : "https://i.stack.imgur.com/l60Hf.png";
//             // final largeIconPath = await UtilsDownloadFile.downloadFile(
//             //   urlImage,
//             //   'largeIcon',
//             // );
//             final Map<String, dynamic> notification = {
//               'title': userProfile.fullName,
//               'body': message,
//             };
//             // final Map<String, dynamic> data = {
//             //   'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//             //   'id': 1,
//             //   'messageType': TypeNotification.chat.toString(),
//             //   "sendById": ownerUserID,
//             //   "sendBy": userProfile.fullName,
//             //   "chat": <String, dynamic>{
//             //     "idChat": widget.chat.idChat,
//             //     "presence": widget.chat.presenceUserChat,
//             //     "stampTimeUser": widget.chat.stampTimeUser.toString(),
//             //   },
//             //   'image': largeIconPath,
//             //   'status': 'done',
//             // };
//             // await sendMessage(
//             //   notification: notification,
//             //   tokenUserFriend: userProfileFriend!.token,
//             //   data: data,
//             // );
//           }
//         },
//         icon: const Icon(Icons.send),
//         color: Theme.of(context).primaryColor,
//       );
//     } else {
//       return InkWell(
//         onTap: () {
//           setState(
//             () {
//               firebaseChatMessage.createLikeMessage(
//                 userProfile: widget.ownerUserProfile,
//                 chatID: widget.chat.idChat,
//               );
//             },
//           );
//         },
//         child: Padding(
//           padding:
//               const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.6),
//           child: Image.asset(
//             "assets/icons/like_white.png",
//             color: kPrimaryColor,
//             height: size.height * 0.030,
//           ),
//         ),
//       );
//     }
//   }
// }
