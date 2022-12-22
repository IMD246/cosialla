import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../handle/handle_value.dart';
import '../../../models/info_user_cua_sinh.dart';
import 'user_content_post.dart';

class UserAndContentPost extends StatelessWidget {
  const UserAndContentPost({
    Key? key,
    required this.date,
    required this.content,
    required this.user,
  }) : super(key: key);

  final Timestamp date;
  final String content;
  final String user;

  @override
  Widget build(BuildContext context) {
    DateTime date_comment = DateTime.parse(date.toDate().toString());

    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('userProfile')
            .doc(user)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            final user = InfoUserCuaSinh.fromSnapshot(snapshot.data!);
            return UserAndContent(
                content: content,
                user: user,
                date: differenceInCalendarDaysLocalization(
                    date_comment, context));
          }
          return const Text('has erro');
        });
  }
}
