// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:social_ui_kit/services/MessageScreen/bloc/message_bloc.dart';
// import 'package:social_ui_kit/services/MessageScreen/bloc/message_state.dart';
// import 'package:social_ui_kit/services/MessageScreen/firebase/firebase_chat.dart';
// import 'package:social_ui_kit/services/MessageScreen/models/chat.dart';
// import 'package:social_ui_kit/view/chat/components/chat_card.dart';

// class ListChat extends StatefulWidget {
//   const ListChat({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ListChat> createState() => _ListChatState();
// }

// class _ListChatState extends State<ListChat>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;
//   late final FirebaseChat firebaseChat;
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
//         return FutureBuilder<Iterable<Future<Chat>>?>(
//           future: firebaseChat.getAllChat(ownerUserID: state.userProfile.id),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final listChat = snapshot.data!;
//               return ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: listChat.length,
//                 itemBuilder: (context, index) {
//                   return ChatCard(
//                     chat: listChat.elementAt(index),
//                   );
//                 },
//               );
//             } else {
//               return Center(
//                 child: SizedBox(
//                   height: 200,
//                   child: Text(
//                     "Let Add Some Chat",
//                     style: TextStyle(fontSize: 25),
//                   ),
//                 ),
//               );
//             }
//           },
//         );
//       },
//     );
//   }
// }
