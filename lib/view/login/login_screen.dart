import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/LoginBloc/auth_bloc.dart';
import '../../bloc/LoginBloc/auth_event.dart';
import '../../constants/constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in App"),
      ),
      body: Column(
        children: [
          SignInIcon(
            width: 400.w,
            urlImage: "assets/icons/googles_signin_icon.png",
            textSignIn: 'Sign In With Google',
            press: () async {
              context.read<AuthBloc>().add(
                    AuthEventLoginByGoogle(),
                  );
            },
          ),
        ],
      ),
    );
    //  return RootApp(
    //   userProfile: state.userProfile,
    // );
  }
}

class SignInIcon extends StatelessWidget {
  const SignInIcon({
    Key? key,
    required this.urlImage,
    required this.textSignIn,
    required this.press,
    this.width = 40,
  }) : super(key: key);
  final String urlImage;
  final String textSignIn;
  final VoidCallback press;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Container(
          width: width,
          padding: EdgeInsets.all(
            8.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextSignIn(),
              IconSignIn(),
            ],
          ),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(24.w),
          ),
        ),
      ),
    );
  }

  Widget IconSignIn() {
    return Image.asset(
      urlImage,
      fit: BoxFit.cover,
      width: 40.w,
    );
  }

  Widget TextSignIn() {
    return Text(
      textSignIn,
      style: TextStyle(
        fontSize: 20.sp,
      ),
    );
  }
}
