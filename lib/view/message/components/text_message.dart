import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../handle/handle_value.dart';
import '../../../models/chat_message.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.chatMessage,
    required this.isSelected,
  }) : super(key: key);

  final ChatMessage chatMessage;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding * 0.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: !isSelected
            ? kPrimaryColor.withOpacity(chatMessage.isSender != null
                ? chatMessage.isSender!
                    ? 0.8
                    : 0.3
                : 0.3)
            : kPrimaryColor.withOpacity(0.9),
      ),
      child: Text(
        handleStringMessage(chatMessage.value),
        softWrap: true,
        style: TextStyle(
          fontSize: chatMessage.hasSender ? 14 : 24,
          color: textColorMode(ThemeMode.light).withOpacity(
            chatMessage.isSender != null
                ? chatMessage.isSender!
                    ? 1
                    : 0.7
                : 0.7,
          ),
        ),
      ),
    );
  }
}
