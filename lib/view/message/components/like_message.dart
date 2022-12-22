import 'package:flutter/material.dart';
import 'package:social_ui_kit/constants/constants.dart';

class LikeMessage extends StatelessWidget {
  const LikeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3,
      height: size.height * 0.08,
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding * 0.5,
      ),
      child: Image.asset(
        "assets/icons/like_white.png",
        fit: BoxFit.fill,
        color: kPrimaryColor,
      ),
    );
  }
}
