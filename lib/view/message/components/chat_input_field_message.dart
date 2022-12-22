// // ignore_for_file: unused_local_variable

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:flutter_sound_lite/flutter_sound.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// import '../../../../constants/constants.dart';
// import '../../../extensions/locallization.dart';
// import '../../../handle/handle_value.dart';
// import '../../../models/chat.dart';
// import '../../../models/user_profile.dart';
// import '../../../services/LoginScreen/firebase/firebase_user_profile.dart';
// import '../../../services/MessageScreen/firebase/firebase_chat.dart';
// import '../../../services/MessageScreen/firebase/firebase_chat_message.dart';
// import '../../../services/models/storage/storage.dart';
// import 'emoji_picker_text_field.dart';
// import 'send_message.dart';
// import 'upload_image_message.dart';

// class ChatInputFieldMessage extends StatefulWidget {
//   const ChatInputFieldMessage({
//     Key? key,
//     required this.chat,
//     required this.scroll,
//     required this.ownerUserProfile,
//   }) : super(key: key);
//   final Chat chat;
//   final ItemScrollController scroll;
//   final UserProfile ownerUserProfile;
//   @override
//   State<ChatInputFieldMessage> createState() => _ChatInputFieldMessageState();
// }

// class _ChatInputFieldMessageState extends State<ChatInputFieldMessage> {
//   late final TextEditingController textController;
//   // late final FirebaseChatMessage firebaseChatMessage;
//   late final FirebaseUserProfile firebaseUserProfile;
//   final FirebaseChat firebaseChat = FirebaseChat();
//   late final Storage storage;
//   late FocusNode focusNode;
//   final recorder = FlutterSoundRecorder();
//   bool isSelected = false;

//   bool emojiShowing = false;

//   String? recordTxt;
//   Future record() async {
//     await recorder.startRecorder(toFile: 'audio');
//   }

//   Future stop() async {
//     final path = await recorder.stopRecorder();

//     await firebaseChatMessage.createAudioMessage(
//       chatID: widget.chat.idChat,
//       context: context,
//       ownerUserProfile: widget.ownerUserProfile,
//     );
//     await storage.uploadFileAudio(
//       filePath: path!,
//       firebaseChatMessage: firebaseChatMessage,
//       firebaseUserProfile: firebaseUserProfile,
//       idChat: widget.chat.idChat,
//       userOwnerID: widget.ownerUserProfile.id,
//       context: context,
//     );
//     String userIDFriend = widget.chat.listUser.first;
//     final ownerUserID = widget.ownerUserProfile.id;
//     if (userIDFriend.compareTo(ownerUserID) != 0) {
//       final chat = await firebaseChat.getChatByID(
//         idChat: widget.chat.idChat,
//         userChatID: ownerUserID,
//       );
//       final userProfileFriend = await firebaseUserProfile.getUserProfile(
//         userIDFriend,
//       );
//       final Map<String, dynamic> notification = {
//         'title': widget.ownerUserProfile.fullName,
//         'body': getStringMessageByTypeMessage(
//           typeMessage: chat.typeMessage,
//           value: chat.lastText,
//           context: context,
//         ),
//       };
//       final urlImage = widget.ownerUserProfile.urlImage.isNotEmpty
//           ? widget.ownerUserProfile.urlImage
//           : "https://i.stack.imgur.com/l60Hf.png";
//       // final largeIconPath = await UtilsDownloadFile.downloadFile(
//       //   urlImage,
//       //   'largeIcon',
//       // );
//       // final Map<String, dynamic> data = {
//       //   'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//       //   'id': 1,
//       //   'messageType': TypeNotification.chat.toString(),
//       //   "sendById": ownerUserID,
//       //   "sendBy": widget.ownerUserProfile.fullName,
//       //   "chat": <String, dynamic>{
//       //     "idChat": widget.chat.idChat,
//       //     "presence": widget.chat.presenceUserChat,
//       //     "stampTimeUser": widget.chat.stampTimeUser.toString(),
//       //   },
//       //   'image': largeIconPath,
//       //   'status': 'done',
//       // };
//       // sendMessage(
//       //   notification: notification,
//       //   tokenUserFriend: userProfileFriend!.token,
//       //   data: data,
//       // );
//     }
//   }

//   Future initRecorder() async {
//     final status = await Permission.microphone.request();
//     if (status != PermissionStatus.granted) {
//       throw 'Microphone permission not granted';
//     }
//     await recorder.openAudioSession();
//     await recorder.setSubscriptionDuration(
//       const Duration(milliseconds: 500),
//     );
//   }

//   @override
//   void initState() {
//     textController = TextEditingController();
//     firebaseChatMessage = FirebaseChatMessage();
//     firebaseUserProfile = FirebaseUserProfile();
//     storage = Storage();
//     focusNode = FocusNode();
//     KeyboardVisibilityController().onChange.listen((event) {
//       if (!event) {
//         focusNode.unfocus();
//       }
//       if (event && emojiShowing) {
//         setState(() {
//           emojiShowing = !emojiShowing;
//         });
//       }
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     textController.clear();
//     textController.dispose();
//     recorder.closeAudioSession();
//     firebaseChatMessage.deleteMessageNotSent(
//       ownerUserID: widget.ownerUserProfile.id,
//       chatID: widget.chat.idChat,
//     );
//     focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Theme.of(context).primaryColor.withOpacity(0.1),
//             boxShadow: [
//               BoxShadow(
//                 offset: const Offset(0, 4),
//                 blurRadius: 32,
//                 color: const Color(0xFF087949).withOpacity(0.08),
//               ),
//             ],
//           ),
//           child: SafeArea(
//             child: Row(
//               children: [
//                 UploadImageMessage(
//                   ownerUserProfile: widget.ownerUserProfile,
//                   chat: widget.chat,
//                   scroll: widget.scroll,
//                 ),
//                 UploadAudioMessage(),
//                 InputMessageField(),
//                 SendMessage(
//                   textController: textController,
//                   ownerUserProfile: widget.ownerUserProfile,
//                   chat: widget.chat,
//                   scroll: widget.scroll,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         EmojiPickerTextField(
//           textController: textController,
//           emojiShowing: emojiShowing,
//         ),
//       ],
//     );
//   }

//   Widget InputMessageField() {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.symmetric(
//           horizontal: kDefaultPadding * 0.75,
//         ),
//         margin: const EdgeInsets.symmetric(
//           vertical: kDefaultPadding * 0.4,
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 focusNode: focusNode,
//                 controller: textController,
//                 onTap: () async {
//                   if (isSelected) {
//                     setState(() {
//                       isSelected = false;
//                       recorder.stopRecorder();
//                       recorder.deleteRecord(fileName: 'audio');
//                     });
//                   } else {
//                     await firebaseChatMessage.deleteMessageNotSent(
//                         ownerUserID: widget.ownerUserProfile.id,
//                         chatID: widget.chat.idChat);
//                     if (widget.scroll.isAttached) {
//                       widget.scroll.scrollTo(
//                         index: intMaxValue,
//                         duration: const Duration(milliseconds: 300),
//                         curve: Curves.easeIn,
//                       );
//                     }
//                   }
//                 },
//                 onChanged: (value) async {
//                   setState(() {});
//                   if (textController.text.isNotEmpty) {
//                     await firebaseChatMessage.createTextMessageNotSent(
//                       userID: widget.ownerUserProfile.id,
//                       chatID: widget.chat.idChat,
//                     );
//                     if (widget.scroll.isAttached) {
//                       widget.scroll.scrollTo(
//                         index: intMaxValue,
//                         duration: const Duration(milliseconds: 300),
//                         curve: Curves.easeIn,
//                       );
//                     }
//                   }
//                   if (textController.text.isEmpty) {
//                     await firebaseChatMessage.deleteMessageNotSent(
//                       ownerUserID: widget.ownerUserProfile.id,
//                       chatID: widget.chat.idChat,
//                     );
//                   }
//                 },
//                 minLines: 1,
//                 maxLines: 5,
//                 keyboardType: TextInputType.multiline,
//                 decoration: InputDecoration(
//                   hintText: isSelected
//                       ? context.loc.recording
//                       : context.loc.type_message,
//                   hintStyle: TextStyle(
//                     color: Theme.of(context).primaryColor,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             if (isSelected)
//               StreamBuilder<RecordingDisposition>(
//                 stream: recorder.onProgress,
//                 builder: (context, snapshot) {
//                   final duration = snapshot.hasData
//                       ? snapshot.data!.duration
//                       : Duration.zero;

//                   return Text("${formatTime(duration)} s");
//                 },
//               )
//             else
//               IconButton(
//                 onPressed: () async {
//                   await SystemChannels.textInput.invokeMethod('TextInput.hide');
//                   await Future.delayed(Duration(milliseconds: 50));
//                   setState(() {
//                     emojiShowing = !emojiShowing;
//                   });
//                 },
//                 icon: Icon(
//                   Icons.sentiment_satisfied_alt,
//                   color: Theme.of(context).primaryColor,
//                 ),
//               ),
//           ],
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//           color: Theme.of(context).primaryColor.withOpacity(0.1),
//         ),
//       ),
//     );
//   }

//   Widget UploadAudioMessage() {
//     return IconButton(
//       onPressed: () async {
//         await initRecorder();
//         if (recorder.isRecording && isSelected) {
//           await stop();
//           setState(() {
//             isSelected = false;
//           });
//         } else {
//           await record();
//           setState(() {
//             isSelected = true;
//           });
//         }
//       },
//       icon: isSelected ? const Icon(Icons.stop) : const Icon(Icons.mic),
//       color: Theme.of(context).primaryColor,
//     );
//   }
// }
