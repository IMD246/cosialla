import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class InputNewComment extends StatelessWidget {
  const InputNewComment({
    Key? key,
    required TextEditingController commentController,
    required this.idPost,
  })  : _commentController = commentController,
        super(key: key);

  final TextEditingController _commentController;
  final String idPost;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Container(
                 margin:EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom+ 12),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.white.withOpacity(0.8),
                ),
                child: TextField(
                  controller: _commentController,
                  cursorColor: Colors.black54,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 25),
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                    hintText: "Write a comment ...",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(
                        width: 0.3,
                        color: Color(0xFFE5E5E5).withOpacity(0.5),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(width: 0.3, color: Colors.black
                          // Color(0xFFE5E5E5).withOpacity(0.5),
                          ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(
                          width: 0.3,
                          color: Color(0xFFE5E5E5).withOpacity(0.5)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              margin:EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom+ 12),
              child: IconButton(
                onPressed: () {
                  // if (_commentController.text.length > 0) {
                  //   FireBaseComments.addNewComment(
                  //       _commentController.text, idPost);
                  //   _commentController.clear();
                  // }
                },
                icon: Icon(
                  Icons.send,
                  size: 28,
                  color: blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
