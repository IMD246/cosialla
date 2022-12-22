import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/post.dart';
import '../../../theme/colors.dart';
import 'check_data_user_content.dart';
import 'image_post.dart';

class Posts extends StatelessWidget {
  const Posts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('post').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        if (snapshot.hasData) {
          final list = snapshot.data!.docs;
          return ListView(
            primary: false,
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: list.map((data) {
              final post = Post.fromSnapshot(data);
              return Container(
                margin: const EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 15,
                        offset: Offset(0, 1))
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: white.withOpacity(0.8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //user and content
                      UserAndContentPost(
                        date: post.date,
                        content: post.contents,
                        user: post.user,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //img post
                      PostImage(
                        urlImage: post.image,
                      ),
                      //Like & comment & share
                      // Container(
                      //   margin: EdgeInsets.only(top: 12),
                      //   child: StreamBuilder<Iterable<Comment>?>(
                      //     stream: FireBaseComments.getComments(post
                      //         .id), //get comments list for action press btn comment
                      //     builder: (context, snapshot) {
                      //       switch (snapshot.connectionState) {
                      //         case ConnectionState.waiting:
                      //           return CircularProgressIndicator();
                      //         case ConnectionState.active:
                      //           if (snapshot.hasData) {
                      //             final listComments = snapshot.data!;
                      //             return LikeCommentShare(
                      //               qtyLove: post.loves.length,
                      //               comments: listComments,
                      //               idPost: post.id,
                      //               userLoves: post.loves,
                      //             );
                      //           } else {
                      //             return LikeCommentShare(
                      //               qtyLove: post.loves.length,
                      //               comments: [],
                      //               idPost: post.id,
                      //               userLoves: post.loves,
                      //             );
                      //           }
                      //         default:
                      //           return CircularProgressIndicator();
                      //       }
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }
        return Text("don't have data!");
      },
    );
  }
}
