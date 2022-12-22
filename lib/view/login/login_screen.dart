import 'package:flutter/material.dart';

import 'components/body_login_screen.dart';

class LoginScreen extends StatefulWidget {
    LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
            body: BodyLoginScreen(),
          );
          //  return RootApp(
          //   userProfile: state.userProfile,
          // );
  }
}
