import 'dart:html';

import 'package:flutter/material.dart';

import 'input_new_comment.dart';

Future<void> ListComment(
    BuildContext context, Iterable<Comment> comments, String idPost) {
  final TextEditingController _commentController = TextEditingController();
  return showModalBottomSheet<void>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.9,
        child: Column(
          children: [
            //listComments
            // ShowListComments(
            //   comments: comments,
            // ),
            //inputNewComments
            InputNewComment(
              commentController: _commentController,
              idPost: idPost,
            ),
            // const SizedBox(
            //   height: 6,
            // ),
          ],
        ),
      );
    },
  );
}
