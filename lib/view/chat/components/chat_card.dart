// // import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';
// import 'package:social_ui_kit/constants/constants.dart';
// import 'package:social_ui_kit/handle/handle_value.dart';
// import 'package:social_ui_kit/services/MessageScreen/firebase/firebase_chat.dart';
// import 'package:social_ui_kit/services/MessageScreen/models/chat.dart';
// import 'package:social_ui_kit/theme/colors.dart';
// import 'package:social_ui_kit/view/message/message_screen.dart';

// class ChatCard extends StatefulWidget {
//   ChatCard({
//     Key? key,
//     required this.chat,
//   }) : super(key: key);
//   final Future<Chat> chat;

//   @override
//   State<ChatCard> createState() => _ChatCardState();
// }

// class _ChatCardState extends State<ChatCard>
//     with AutomaticKeepAliveClientMixin {
//   late final firebaseChat;
//   @override
//   bool get wantKeepAlive => true;
//   @override
//   void initState() {
//     firebaseChat = FirebaseChat();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return BlocBuilder<MessageBloc, MessageState>(
//       builder: (context, state) {
//         final userProfile = state.userProfile;
//         return FutureBuilder<Chat>(
//           future: widget.chat,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final chat = snapshot.data!;
//               return InkWell(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return MesssageScreen(
//                           chat: chat,
//                           ownerUserProfile: userProfile,
//                         );
//                       },
//                     ),
//                   );
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 20),
//                   child: Container(
//                     height: 100,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: grey.withOpacity(0.15),
//                           spreadRadius: 2,
//                           blurRadius: 15,
//                           offset: Offset(0, 1),
//                         ),
//                       ],
//                       color: white.withOpacity(0.6),
//                       borderRadius: BorderRadius.circular(33),
//                     ),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Stack(
//                           children: [
//                             Container(
//                               width: 65,
//                               height: 65,
//                               child: Center(
//                                 child: Container(
//                                   width: 60,
//                                   height: 60,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     image: DecorationImage(
//                                       image: chat.urlImage != null
//                                           ? NetworkImage(chat.urlImage!)
//                                           : Image.asset(
//                                                   "assets/images/defaultImage.png")
//                                               .image,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             if (chat.presenceUserChat)
//                               Positioned(
//                                 bottom: 0,
//                                 right: 4,
//                                 child: Container(
//                                   height: 16,
//                                   width: 16,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: kPrimaryColor,
//                                     border: Border.all(
//                                       color: Theme.of(context)
//                                           .scaffoldBackgroundColor,
//                                       width: 3,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Flexible(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 chat.nameChat,
//                                 style: TextStyle(fontSize: 15, color: black),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 chat.lastText,
//                                 style: TextStyle(
//                                   overflow: TextOverflow.ellipsis,
//                                   fontSize: 14,
//                                   color: black.withOpacity(0.5),
//                                 ),
//                               ),
//                               Opacity(
//                                 opacity: 0.64,
//                                 child: Text(
//                                   differenceInCalendarDaysLocalization(
//                                       chat.stampTime, context),
//                                   style: const TextStyle(
//                                     fontSize: 11,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             } else {
//               return Text("");
//             }
//           },
//         );
//       },
//     );
//   }
// }
