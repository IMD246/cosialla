import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import 'body_profile_page.dart';

class Posts extends StatelessWidget {
  const Posts({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final BodyProfilePage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Posts",
          style: TextStyle(fontSize: 15, color: black),
        ),
        SizedBox(
          height: 8,
        ),
        // FutureBuilder<int?>(
        //   future: FireBasePosts.getAllPost(userID: widget.userProfile.id),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return Text(
        //         snapshot.data!.toString(),
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       );
        //     } else {
        //       return Text(
        //         "0",
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       );
        //     }
        //   },
        // ),
      ],
    );
  }
}
