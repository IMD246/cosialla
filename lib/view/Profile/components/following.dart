import 'package:flutter/material.dart';
import 'package:social_ui_kit/services/UserProfileScreen/firebase/firebase_follow.dart';
import 'package:social_ui_kit/theme/colors.dart';
import 'package:social_ui_kit/view/Profile/components/body_profile_page.dart';

class Following extends StatelessWidget {
  const Following({
    Key? key,
    required this.firebaseFollowers,
    required this.widget,
  }) : super(key: key);

  final FirebaseFollow firebaseFollowers;
  final BodyProfilePage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Following",
          style: TextStyle(fontSize: 15, color: black),
        ),
        SizedBox(
          height: 8,
        ),
        FutureBuilder<List<String>?>(
          future: firebaseFollowers.getAllFollowing(
              userID: widget.userProfile.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!.length.toString(),
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              );
            } else {
              return Text(
                "0",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              );
            }
          },
        ),
      ],
    );
  }
}