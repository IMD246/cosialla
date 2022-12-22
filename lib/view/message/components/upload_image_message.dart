// // ignore_for_file: unused_local_variable

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// import '../../../constants/constants.dart';
// import '../../../handle/handle_value.dart';
// import '../../../models/chat.dart';
// import '../../../models/user_profile.dart';
// import '../../../services/LoginScreen/firebase/firebase_user_profile.dart';
// import '../../../services/MessageScreen/firebase/firebase_chat_message.dart';
// import '../../../services/models/storage/storage.dart';

// class UploadImageMessage extends StatelessWidget {
//   const UploadImageMessage({
//     Key? key,
//     required this.chat,
//     required this.ownerUserProfile,
//     required this.scroll,
//   }) : super(key: key);

//   final Chat chat;
//   final UserProfile ownerUserProfile;
//   final ItemScrollController scroll;

//   @override
//   Widget build(BuildContext context) {
//     final Storage storage = Storage();
//     final FirebaseChatMessage firebaseChatMessage = FirebaseChatMessage();
//     final FirebaseUserProfile firebaseUserProfile = FirebaseUserProfile();

//     return IconButton(
//       onPressed: () async {
//         final results = await FilePicker.platform.pickFiles(
//           allowMultiple: true,
//           type: FileType.custom,
//           allowedExtensions: ['jpg', 'jpeg', 'png'],
//         );
//         if (results != null) {
//           await firebaseChatMessage.createImageMessage(
//             ownerUserProfile: ownerUserProfile,
//             chatID: chat.idChat,
//             context: context,
//           );
//           final lastMessageUserOwner =
//               await firebaseChatMessage.getImageMessageNotSentOwnerUser(
//             userID: ownerUserProfile.id,
//             chatID: chat.idChat,
//           );
//           await storage.uploadMultipleFile(
//             listFile: results.files,
//             idChat: chat.idChat,
//             firebaseChatMessage: firebaseChatMessage,
//             lastMessageUserOwner: lastMessageUserOwner,
//             context: context,
//             ownerUserProfile: ownerUserProfile,
//           );
//           if (scroll.isAttached) {
//             scroll.scrollTo(
//               index: intMaxValue,
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeIn,
//             );
//           }
//           String userIDFriend = "";
//           final ownerUserID = ownerUserProfile.id;
//           if (userIDFriend.compareTo(ownerUserID) != 0) {
//             final userProfile = ownerUserProfile;
//             final userProfileFriend = await firebaseUserProfile.getUserProfile(
//               userIDFriend,
//             );
//             final Map<String, dynamic> notification = {
//               'title': userProfile.fullName,
//               'body': handleStringMessageLocalization(
//                 chat.lastText,
//                 context,
//               ),
//             };
//             final urlImage = userProfile.urlImage.isNotEmpty
//                 ? userProfile.urlImage
//                 : "https://i.stack.imgur.com/l60Hf.png";
//             // final largeIconPath = await UtilsDownloadFile.downloadFile(
//             //   urlImage,
//             //   'largeIcon',
//             // );
//             // final Map<String, dynamic> data = {
//             //   'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//             //   'id': 1,
//             //   'messageType': TypeNotification.chat.toString(),
//             //   "sendById": ownerUserID,
//             //   "sendBy": userProfile.fullName,
//             //   "chat": <String, dynamic>{
//             //     "idChat": chat.idChat,
//             //     "presence": chat.presenceUserChat,
//             //     "stampTimeUser": chat.stampTimeUser.toString(),
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
//         }
//       },
//       icon: const Icon(Icons.photo),
//       color: Theme.of(context).primaryColor,
//     );
//   }
// }
