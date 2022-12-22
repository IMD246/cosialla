import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import 'comments.dart';


class LikeCommentShare extends StatefulWidget {
  LikeCommentShare({
    Key? key,
    required this.qtyLove,
    required this.comments,
    required this.idPost,
    required this.userLoves,
  }) : super(key: key);

  final int qtyLove;
  final Iterable<Comment> comments;
  final String idPost;
  final List<dynamic> userLoves;

  @override
  State<LikeCommentShare> createState() => _LikeCommentShareState();
}

class _LikeCommentShareState extends State<LikeCommentShare> {
  bool isLove = false;
  bool isComment = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FireBasePosts.checkLove(widget.userLoves).then((value) {
    //   setState(() {
    //     isLove = value;
    //   });
    // });
    // FireBasePosts.checkIsComment(widget.comments).then((value) {
    //   setState(() {
    //     isComment = value;
    //   });
    // });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Love
        InkWell(
          onTap: () {
            // setState(() {
            //   FireBasePosts.processLove(widget.idPost, widget.userLoves);
            // });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                isLove ? CupertinoIcons.heart_solid : CupertinoIcons.heart,
                color: isLove ? red : Colors.black26,
                size: 32,
                shadows: [
                  BoxShadow(
                      color: grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: Offset(0, 1))
                ],
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "${widget.qtyLove}",
                style: TextStyle(fontSize: 16, color: black),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            ListComment(context, widget.comments, widget.idPost);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                isComment
                    ? CupertinoIcons.bubble_left_fill
                    : CupertinoIcons.bubble_left,
                color: isComment ? blue : Colors.black26,
                size: 28,
                shadows: [
                  BoxShadow(
                      color: grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: Offset(0, 1))
                ],
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "${widget.comments.length}",
                style: TextStyle(fontSize: 16, color: black),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              CupertinoIcons.arrowshape_turn_up_right,
              color: Colors.black26,
              size: 28,
              shadows: [
                BoxShadow(
                    color: grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 15,
                    offset: Offset(0, 1))
              ],
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "0",
              style: TextStyle(fontSize: 16, color: black),
            )
          ],
        ),
      ],
    );
  }
}
