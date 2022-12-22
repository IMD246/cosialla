// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../bloc/login_bloc/auth_bloc.dart';
// import '../../../bloc/login_bloc/auth_event.dart';
// import 'sign_in_button.dart';

// class BodyLoginScreen extends StatelessWidget {
//   const BodyLoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Spacer(),
//         // Center(
//         //   child: SvgPicture.asset(
//         //     "assets/images/bg_primary.svg",
//         //     width: 200.w,
//         //     color: Colors.amber,
//         //   ),
//         // ),
//         SizedBox(
//           height: 40,
//         ),
//         SignInIcon(
//           urlImage: "assets/icons/googles_signin_icon.png",
//           textSignIn: 'Sign In With Google',
//           press: () async {
//             context.read<AuthBloc>().add(
//                   AuthEventLoginByGoogle(),
//                 );
//           },
//         ),
//         // Spacer(),
//       ],
//     );
//   }
// }
