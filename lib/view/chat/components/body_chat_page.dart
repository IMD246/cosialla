// import 'package:flutter/material.dart';

// import '../../../theme/colors.dart';
// import 'list_chat.dart';
// import 'searchForChat/search_for_chat.dart';

// class BodyChatPage extends StatefulWidget {
//   const BodyChatPage({Key? key}) : super(key: key);

//   @override
//   State<BodyChatPage> createState() => _BodyChatPageState();
// }

// class _BodyChatPageState extends State<BodyChatPage>
//     with AutomaticKeepAliveClientMixin<BodyChatPage> {
//   @override
//   bool get wantKeepAlive => true;
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return BlocBuilder<MessageBloc, MessageState>(
//       builder: (context, state) {
//         if (state is NotJoinedMessageRoomState) {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 25, right: 25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "Messages",
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   InkWell(
//                     customBorder: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return SearchForChat(
//                               userProfile: state.userProfile,
//                             );
//                           },
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 48,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.black.withOpacity(0.4),
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Icon(
//                             Icons.search,
//                             color: black,
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Flexible(
//                             child: Text(
//                               "Search",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline6!
//                                   .copyWith(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   ListChat(),
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }
