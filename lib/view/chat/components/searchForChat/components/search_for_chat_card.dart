import 'package:flutter/material.dart';

import '../../../../../models/user_profile.dart';

class SearchForChatCard extends StatefulWidget {
  const SearchForChatCard({
    Key? key,
    required this.userProfile,
    required this.ownerUserProfile,
  }) : super(key: key);
  final UserProfile userProfile;
  final UserProfile ownerUserProfile;
  @override
  State<SearchForChatCard> createState() => _SearchForChatCardState();
}

class _SearchForChatCardState extends State<SearchForChatCard> {
  // late final FirebaseUserPresence firebaseUserPresence;
  // late final FirebaseChat firebaseChat;

  @override
  void initState() {
    // firebaseUserPresence = FirebaseUserPresence();
    // firebaseChat = FirebaseChat();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<UserPresence>(
    //   future: firebaseUserPresence.getUserPresence(
    //     userID: widget.userProfile.id,
    //   ),
    //   builder: (context, snapshot) {
    //     switch (snapshot.connectionState) {
    //       case ConnectionState.done:
    //         final userPresence = snapshot.data;
    //         return InkWell(
    //           onTap: () async {
    //             await firebaseChat.createChat(
    //               listUserID: [
    //                 widget.ownerUserProfile.id,
    //                 widget.userProfile.id
    //               ],
    //             );
    //             final chat = await firebaseChat.getChatByIDUsersJoined(
    //               listUserChatID: [
    //                 widget.ownerUserProfile.id,
    //                 widget.userProfile.id
    //               ],
    //               userPresenceChat: userPresence,
    //               userProfileChat: widget.userProfile,
    //               isInMessageScreen: true,
    //             );
    //             Navigator.of(context).push(
    //               MaterialPageRoute(
    //                 builder: (context) {
    //                   return MesssageScreen(
    //                     chat: chat,
    //                     ownerUserProfile: widget.ownerUserProfile,
    //                   );
    //                 },
    //               ),
    //             );
    //           },
    //           child: ListTile(
    //             leading: Stack(
    //               children: [
    //                 if (widget.userProfile.urlImage.isNotEmpty)
    //                   CircleAvatar(
    //                     backgroundColor: Colors.cyan[100],
    //                     radius: 20,
    //                     child: ClipOval(
    //                       child: SizedBox.fromSize(
    //                         size: const Size.fromRadius(60),
    //                         child: CachedNetworkImage(
    //                           imageUrl: widget.userProfile.urlImage,
    //                           fit: BoxFit.cover,
    //                           placeholder: (context, url) =>
    //                               const CircularProgressIndicator(),
    //                           errorWidget: (context, url, error) =>
    //                               const Icon(Icons.error),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 if (widget.userProfile.urlImage.isEmpty)
    //                   CircleAvatar(
    //                     backgroundColor: Colors.cyan[100],
    //                     backgroundImage: const AssetImage(
    //                       "assets/images/defaultImage.png",
    //                     ),
    //                   ),
    //                 if (userPresence!.presence)
    //                   Positioned(
    //                     bottom: 0,
    //                     right: 0,
    //                     child: Container(
    //                       height: 16,
    //                       width: 16,
    //                       decoration: BoxDecoration(
    //                         shape: BoxShape.circle,
    //                         color: kPrimaryColor,
    //                         border: Border.all(
    //                           color: Theme.of(context).scaffoldBackgroundColor,
    //                           width: 3,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //               ],
    //             ),
    //             title: Text(
    //               widget.userProfile.fullName,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ),
    //         );
    //       default:
    //         return Text("");
    //     }
    //   },
    // );
    return Container();
  }
}
