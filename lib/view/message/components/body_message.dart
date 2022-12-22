import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../models/chat.dart';
import '../../../models/user_profile.dart';

class BodyMessage extends StatefulWidget {
  const BodyMessage(
      {Key? key, required this.chat, required this.ownerUserProfile})
      : super(key: key);
  final Chat chat;
  final UserProfile ownerUserProfile;
  @override
  State<BodyMessage> createState() => _BodyMessageState();
}

class _BodyMessageState extends State<BodyMessage> {
  // late final FirebaseChatMessage firebaseChatMessage;
  late final ItemScrollController scrollController;
  

  @override
  void initState() {
    // firebaseChatMessage = FirebaseChatMessage();
    scrollController = ItemScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // StreamBuilder(
        //   stream: firebaseChatMessage.getAllMessage(
        //     chatID: widget.chat.idChat,
        //     ownerUserID: widget.ownerUserProfile.id,
        //   ),
        //   builder: (context, snapshot) {
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.active:
        //         if (scrollController.isAttached) {
        //           scrollController.scrollTo(
        //             index: intMaxValue,
        //             duration: const Duration(milliseconds: 300),
        //             curve: Curves.easeIn,
        //           );
        //         }
        //         final allChatMessage = snapshot.data as Iterable<ChatMessage>;
        //         return Expanded(
        //           child: ScrollablePositionedList.builder(
        //             initialScrollIndex: allChatMessage.length,
        //             itemScrollController: scrollController,
        //             itemCount: allChatMessage.length,
        //             itemBuilder: (context, index) {
        //               if (index != -1) {
        //                 if (allChatMessage.elementAt(index).messageStatus ==
        //                     MessageStatus.notSent) {
        //                   return Visibility(
        //                     visible: allChatMessage.elementAt(index).isSender ==
        //                         false,
        //                     child: MessageCard(
        //                       chatMessage: allChatMessage.elementAt(index),
        //                       listChatMesage: allChatMessage,
        //                       index: index,
        //                       beforeIndex: index - 1,
        //                       chat: widget.chat,
        //                       scrollController: scrollController, ownerUserProfile: widget.ownerUserProfile,
        //                     ),
        //                   );
        //                 } else {
        //                   return MessageCard(
        //                     chatMessage: allChatMessage.elementAt(index),
        //                     listChatMesage: allChatMessage,
        //                     index: index,
        //                     beforeIndex: index - 1,
        //                     chat: widget.chat,
        //                     scrollController: scrollController, ownerUserProfile: widget.ownerUserProfile,
        //                   );
        //                 }
        //               } else {
        //                 return Container(
        //                   color: Theme.of(context).scaffoldBackgroundColor,
        //                 );
        //               }
        //             },
        //           ),
        //         );
        //       case ConnectionState.waiting:
        //         return const SizedBox(
        //           height: 100,
        //           width: 100,
        //           child: CircularProgressIndicator(),
        //         );
        //       default:
        //         return const SizedBox(
        //           height: 100,
        //           width: 100,
        //           child: CircularProgressIndicator(),
        //         );
        //     }
        //   },
        // ),
        // ChatInputFieldMessage(
        //   ownerUserProfile: widget.ownerUserProfile,
        //   chat: widget.chat,
        //   scroll: scrollController,
        // ),
      ],
    );
  }
}
