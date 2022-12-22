import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/follow.dart';
import '../../../models/info_user_cua_sinh.dart';
import '../../../theme/colors.dart';
import '../../Profile/info_user_page.dart';

class UserAndContent extends StatelessWidget {
  const UserAndContent({
    Key? key,
    required this.content,
    required this.user,
    required this.date,
  }) : super(key: key);

  final String content;
  final InfoUserCuaSinh user;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () async {
                //get info follow of this user
                Follow follow = Follow(followers: [], following: []);
                // await FireBaseFollows.getFolows(user.id).then((value) {
                //   follow = value;
                // });
                //check is follow of current user
                bool check = false;
                String uid = FirebaseAuth.instance.currentUser!.uid.toString();
                follow.followers.forEach((element) {
                  if (element == uid) {
                    check = true;
                  }
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => InfoUserPage(
                        userProfile: user, isFollowed: check, folow: follow),
                  ),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.urlImage),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.fullName,
                        style: TextStyle(
                            fontSize: 14,
                            color: black,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        date,
                        style: TextStyle(
                            fontSize: 11, color: black.withOpacity(0.8)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                aboutPost(context);
              },
              child: Icon(
                Icons.more_vert_outlined,
                color: black,
                size: 20,
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
        Text(
          content,
          // overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

//
Future<void> aboutPost(BuildContext context) {
  return showModalBottomSheet<void>(
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height / 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 8, left: 20, right: 20),
          child: Column(
            children: [
              //thanh ngang
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: MediaQuery.of(context).size.width / 6,
                  height: 3.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black54,
                  ),
                ),
              ),
              //share and report
              Container(
                margin: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.width / 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color.fromARGB(255, 77, 154, 216),
                                  width: 1),
                            ),
                            child: Icon(
                              CupertinoIcons.arrowshape_turn_up_right,
                              color: Color.fromARGB(255, 77, 154, 216),
                              size: 30,
                              shadows: [
                                BoxShadow(
                                    color: grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 15,
                                    offset: Offset(0, 1))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Chia sẻ",
                          style: TextStyle(fontSize: 16, color: black),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.width / 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color.fromARGB(255, 231, 100, 90),
                                  width: 1),
                            ),
                            child: Icon(
                              CupertinoIcons.exclamationmark_shield,
                              color: Color.fromARGB(255, 231, 100, 90),
                              size: 30,
                              shadows: [
                                BoxShadow(
                                    color: grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 15,
                                    offset: Offset(0, 1))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Báo cáo",
                          style: TextStyle(fontSize: 16, color: black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {},
                // leading: Icon(Icons.account_circle),
                title: const Text("Hủy theo dõi"),
              ),
              Divider(),
              ListTile(
                onTap: () {},
                // leading: Icon(Icons.key_rounded),
                title: const Text("Tắt thông báo về bài viết"),
              ),
              Divider(),
              ListTile(
                onTap: () {},
                // leading: Icon(Icons.privacy_tip_rounded),
                title: const Text("Xóa bài viết khỏi trang cá nhân"),
              ),
              Divider(),
              ListTile(
                onTap: () {},
                // leading: Icon(Icons.logout),
                title: const Text("Thêm vào mục yêu thích"),
              ),
              Divider(),
            ],
          ),
        ),
      );
    },
  );
}
