import 'package:flutter/material.dart';

import '../../../handle/handle_value.dart';
import '../../../models/info_user_cua_sinh.dart';
import '../../../models/story.dart';
import '../../../theme/colors.dart';

class UserAndContentStory extends StatelessWidget {
  const UserAndContentStory({
    Key? key,
    required this.context,
    required this.user,
    required this.story,
  }) : super(key: key);

  final BuildContext context;
  final InfoUserCuaSinh user;
  final Story story;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(story.date.toDate().toString());
    return Positioned(
      top: 36,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.urlImage),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName,
                      style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      differenceInCalendarDaysLocalization(date, context),
                      style: TextStyle(
                          fontSize: 12, color: white.withOpacity(0.8)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  story.contents,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
