import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../services/firebase_auth_provider.dart';
import 'sign_in_button.dart';

class BodyLoginScreen extends StatelessWidget {
  const BodyLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          Icon(size),
          SizedBox(height: size.height * 0.04),
          SignInIcon(
            urlImage: "assets/icons/googles_signin_icon.png",
            textSignIn: 'Sign In With Google',
            press: () async {
              await FirebaseAuthProvider().signInWithGoogle();
            },
          ),
          SizedBox(height: size.height * 0.02),
        ],
      ),
    );
  }

  Widget Icon(Size size) {
    return Center(
      child: SvgPicture.asset(
        "assets/images/bg_primary.svg",
        width: size.width * 0.4,
        color: Colors.amber,
      ),
    );
  }
}
