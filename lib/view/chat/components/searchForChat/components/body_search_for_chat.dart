// import 'package:flutter/material.dart';

// import '../../../../../constants/constants.dart';
// import '../../../../../models/user_profile.dart';
// import '../../../../../services/LoginScreen/firebase/firebase_user_profile.dart';
// import 'list_search_for_chat.dart';

// class BodySearchForChat extends StatefulWidget {
//   const BodySearchForChat({
//     Key? key,
//     required this.userProfile,
//   }) : super(key: key);
//   final UserProfile userProfile;
//   @override
//   State<BodySearchForChat> createState() => _BodySearchForChatState();
// }

// class _BodySearchForChatState extends State<BodySearchForChat> {
//   late final FirebaseUserProfile firebaseUserProfile;
//   late final TextEditingController textController;
//   late final FocusNode focusNode;
//   @override
//   void initState() {
//     firebaseUserProfile = FirebaseUserProfile();
//     textController = TextEditingController();
//     focusNode = FocusNode();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     textController.dispose();
//     focusNode.unfocus();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(
//           height: kDefaultPadding,
//         ),
//         buildSearchText(),
//         const SizedBox(
//           height: kDefaultPadding,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//           child: Align(
//             alignment: Alignment.topLeft,
//             child: Text(
//               "Recommended",
//               style: Theme.of(context)
//                   .textTheme
//                   .headline6!
//                   .copyWith(fontSize: 18, fontWeight: FontWeight.normal),
//             ),
//           ),
//         ),
//         // StreamBuilder<Iterable<UserProfile>?>(
//         //   stream: firebaseUserProfile.getAllUserProfileBySearchText(
//         //       widget.userProfile.id, textController.text),
//         //   builder: (context, snapshot) {
//         //     switch (snapshot.connectionState) {
//         //       case ConnectionState.active:
//         //         if (snapshot.hasData) {
//         //           final listUserProfile = snapshot.data!;
//         //           return ListSearchForChat(
//         //             listUserProfile: listUserProfile,
//         //             ownerUserProfile: widget.userProfile,
//         //           );
//         //         } else {
//         //           return Text("Don't Have Any Data");
//         //         }
//         //       case ConnectionState.waiting:
//         //         return CircularProgressIndicator();
//         //       default:
//         //         return CircularProgressIndicator();
//         //     }
//         //   },
//         // ),
//       ],
//     );
//   }

//   TextField buildSearchText() {
//     return TextField(
//       controller: textController,
//       onChanged: (val) {
//         setState(() {});
//       },
//       focusNode: focusNode,
//       decoration: InputDecoration(
//         hintText: "Search",
//         hintStyle: TextStyle(
//           color: Theme.of(context).textTheme.headline5!.color,
//           fontSize: 20,
//         ),
//         // focusedBorder: UnderlineInputBorder(
//         //   borderSide: BorderSide(
//         //     color: !isDarkTheme
//         //         ? Colors.black.withOpacity(0.1)
//         //         : Colors.white.withOpacity(0.5),
//         //   ),
//         // ),
//         // enabledBorder: UnderlineInputBorder(
//         //   borderSide: BorderSide(
//         //     color: !isDarkTheme
//         //         ? Colors.black.withOpacity(0.1)
//         //         : Colors.white.withOpacity(0.5),
//         //   ),
//         // ),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.only(right: kDefaultPadding),
//           child: IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               // color:
//               //     !isDarkTheme ? Colors.black.withOpacity(0.5) : Colors.white,
//             ),
//           ),
//         ),
//         suffixIcon: Visibility(
//           visible: textController.text.isNotEmpty,
//           child: IconButton(
//             onPressed: () {
//               setState(
//                 () {
//                   textController.clear();
//                   // _onsearchChange(searchTextController.text);
//                 },
//               );
//             },
//             icon: Icon(
//               Icons.close_rounded,
//               // color:
//               //     !isDarkTheme ? Colors.black.withOpacity(0.5) : Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
