// import 'package:flutter/material.dart';
// import '../../../constants/constants.dart';
// import 'image_message_card.dart';

// import '../../../models/chat_message.dart';

// class ImageMessage extends StatefulWidget {
//   const ImageMessage({Key? key, required this.chatMessage}) : super(key: key);
//   final ChatMessage chatMessage;
//   @override
//   State<ImageMessage> createState() => _ImageMessageState();
// }

// class _ImageMessageState extends State<ImageMessage> {
//   late final list = widget.chatMessage.listURLImage!;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Directionality(
//         textDirection: widget.chatMessage.hasSender == true
//             ? widget.chatMessage.isSender!
//                 ? TextDirection.rtl
//                 : TextDirection.ltr
//             : TextDirection.rtl,
//         child: Container(
//           padding: list.length > 1
//               ? widget.chatMessage.hasSender == true
//                   ? widget.chatMessage.isSender!
//                       ? const EdgeInsets.only(left: kDefaultPadding * 3)
//                       : const EdgeInsets.only(right: kDefaultPadding * 3)
//                   : null
//               : widget.chatMessage.hasSender == true
//                   ? widget.chatMessage.isSender!
//                       ? const EdgeInsets.only(left: kDefaultPadding)
//                       : const EdgeInsets.only(right: kDefaultPadding)
//                   : null,
//           child: GridView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: list.length,
//             shrinkWrap: true,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: list.length <= 1 ? 0.5 : 1,
//               crossAxisSpacing: 1,
//             ),
//             itemBuilder: (BuildContext context, int index) {
//               return ImageMessageCard(
//                 urlImage: list.elementAt(index),
//                 chatMessage: widget.chatMessage,
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
