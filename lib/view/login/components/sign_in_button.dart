import 'package:flutter/material.dart';
import 'package:social_ui_kit/constants/constants.dart';

class SignInIcon extends StatelessWidget {
  const SignInIcon({
    Key? key,
    required this.urlImage,
    required this.textSignIn,
    required this.press,
  }) : super(key: key);
  final String urlImage;
  final String textSignIn;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Container(
          width: size.width * 0.75,
          padding: EdgeInsets.all(8),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextSignIn(context, size),
                IconSignIn(size),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }

  Widget IconSignIn(Size size) {
    return Image.asset(
      urlImage,
      fit: BoxFit.cover,
      width: size.width * 0.1,
    );
  }
  
  Widget TextSignIn(BuildContext context, Size size) {
    return Text(
      textSignIn,
      style: TextStyle(
        fontSize: size.width * 0.04,
      ),
    );
  }
}
