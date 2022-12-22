// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../services/LoginScreen/models/user_profile.dart';
// import '../../services/MessageScreen/bloc/message_bloc.dart';
// import '../../theme/colors.dart';
// import 'components/body_chat_page.dart';

// class ChatPage extends StatefulWidget {
//   const ChatPage({Key? key, required this.userProfile}) : super(key: key);
//   final UserProfile userProfile;
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return BlocProvider<MessageBloc>(
//       create: (context) => MessageBloc(userProfile: widget.userProfile),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: white,
//         appBar: PreferredSize(
//           child: getAppBar(),
//           preferredSize: Size.fromHeight(0),
//         ),
//         body: BodyChatPage(),
//       ),
//     );
//   }

//   Widget getAppBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: white,
//     );
//   }
// }
