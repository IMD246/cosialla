// import 'dart:ui' as ui;

// import 'package:flutter/material.dart';

// import '../../../models/chat_message.dart';
// import '../../../services/LoginScreen/firebase/firebase_user_profile.dart';
// import '../../../utilities/image/get_real_size_image.dart';
// import 'full_screen_image.dart';

// class ImageMessageCard extends StatelessWidget {
//   const ImageMessageCard({
//     Key? key,
//     required this.urlImage,
//     required this.chatMessage,
//   }) : super(key: key);

//   final String urlImage;
//   final ChatMessage chatMessage;
//   @override
//   Widget build(BuildContext context) {
//     // final FirebaseUserProfile firebaseUserProfile = FirebaseUserProfile();
//     return GestureDetector(
//       onTap: () async {
//         // final userProfile =
//         //     await firebaseUserProfile.getUserProfile(chatMessage.userID);
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) {
//               return FullScreenImage(
//                 urlImage: urlImage,
//                 fullName: userProfile!.fullName,
//               );
//             },
//           ),
//         );
//       },
//       child: FutureBuilder<ui.Image>(
//         future: GetRealSize.getSize(urlImage),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//               return CircularProgressIndicator();
//             case ConnectionState.done:
//               if (snapshot.hasData) {
//                 final size = snapshot.data!;
//                 return Container(
//                   width: double.infinity,
//                   height: size.height.toDouble(),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Image.network(
//                       urlImage,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 );
//               } else {
//                 return Image.asset("assets/images/defaultImage.png");
//               }
//             default:
//               return CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }
