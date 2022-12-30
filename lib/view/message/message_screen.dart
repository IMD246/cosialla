import 'package:flutter/material.dart';

import '../../models/conversation.dart';
import '../../models/user_presence.dart';
import '../../models/user_profile.dart';

class MesssageScreen extends StatefulWidget {
  const MesssageScreen({
    Key? key,
    required this.ownerUserProfile,
    required this.conversation,
    required this.userPresence,
  }) : super(key: key);
  final Conversation conversation;
  final UserPresence? userPresence;
  final UserProfile ownerUserProfile;
  @override
  State<MesssageScreen> createState() => _MesssageScreenState();
}

class _MesssageScreenState extends State<MesssageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // firebaseChatMessage.deleteMessageNotSent(
    //   ownerUserID: widget.ownerUserProfile.id,
    //   chatID: widget.chat.idChat,
    // );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final isDarkTheme = Provider.of<ThemeChanger>(context).getTheme();
    // return Scaffold(
    //   appBar: buildAppbar(
    //     widget.chat,
    //     ThemeMode.light,
    //     context,
    //   ),
    //   body: BodyMessage(
    //     chat: widget.chat,
    //     ownerUserProfile: widget.ownerUserProfile,
    //   ),
    // );
    return Scaffold(body: Text(widget.conversation.toString(),),);
  }

  // AppBar buildAppbar(Chat chat, ThemeMode themeMode, BuildContext context) {
  //   return AppBar(
  //     automaticallyImplyLeading: false,
  //     title: Row(
  //       children: [
  //         BackButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //         ),
  //         Stack(
  //           children: [
  //             if (chat.urlImage != null)
  //               CircleAvatar(
  //                 backgroundColor: Colors.cyan[100],
  //                 child: ClipOval(
  //                   child: SizedBox.fromSize(
  //                     size: const Size.fromRadius(60),
  //                     child: CachedNetworkImage(
  //                       imageUrl: chat.urlImage!,
  //                       fit: BoxFit.cover,
  //                       placeholder: (context, url) =>
  //                           const CircularProgressIndicator(),
  //                       errorWidget: (context, url, error) =>
  //                           const Icon(Icons.error),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             if (widget.chat.urlImage == null)
  //               const CircleAvatar(
  //                 backgroundImage: AssetImage(
  //                   "assets/images/defaultImage.png",
  //                 ),
  //               ),
  //             if (chat.presenceUserChat)
  //               Positioned(
  //                 bottom: 0,
  //                 right: 0,
  //                 child: Container(
  //                   height: 16,
  //                   width: 12,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color: kPrimaryColor,
  //                     border: Border.all(
  //                       color: Theme.of(context).scaffoldBackgroundColor,
  //                       width: 2,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //           ],
  //         ),
  //         const SizedBox(width: kDefaultPadding * 0.75),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               chat.nameChat,
  //               style: TextStyle(
  //                   color: textColorMode(themeMode).withOpacity(0.8),
  //                   fontSize: 16),
  //             ),
  //             Text(
  //               chat.presenceUserChat
  //                   ? context.loc.online
  //                   : '${context.loc.online} ${differenceInCalendarDaysLocalization(
  //                       widget.chat.stampTimeUser,
  //                       context,
  //                     )}',
  //               style: TextStyle(
  //                 color: Colors.black.withOpacity(
  //                   themeMode == ThemeMode.light ? 0.4 : 0.6,
  //                 ),
  //                 fontSize: 12,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
