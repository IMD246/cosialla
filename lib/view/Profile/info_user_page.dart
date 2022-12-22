import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../data/me_post_json.dart';
import '../../models/follow.dart';
import '../../models/info_user_cua_sinh.dart';
import '../../theme/colors.dart';

class InfoUserPage extends StatefulWidget {
  const InfoUserPage(
      {Key? key,
      required this.userProfile,
      required this.isFollowed,
      required this.folow})
      : super(key: key);
  final InfoUserCuaSinh userProfile;
  final bool isFollowed;
  final Follow folow;

  @override
  _InfoUserPageState createState() => _InfoUserPageState();
}

class _InfoUserPageState extends State<InfoUserPage> {
  bool isPhoto = true;

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(meVideoList[0]['videoUrl']);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
          child: getAppBar(), preferredSize: Size.fromHeight(180)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primaryLight,
      flexibleSpace: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 75,
                height: 75,
                child: Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: widget.userProfile.urlImage.isNotEmpty
                            ? NetworkImage(
                                widget.userProfile.urlImage,
                              )
                            : Image.asset("assets/images/defaultImage.png")
                                .image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.userProfile.fullName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "@" + widget.userProfile.email.split('@').first.toString(),
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "Posts",
                  style: const TextStyle(fontSize: 15, color: black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  // widget.userProfile.posts.toString(),
                  "0",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Followers",
                  style: const TextStyle(fontSize: 15, color: black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  // widget.userProfile.followers.toString(),
                  "${widget.folow.followers.length}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Follow",
                  style: const TextStyle(fontSize: 15, color: black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  // widget.userProfile.following.toString(),
                  "${widget.folow.following.length}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            // FireBaseFollows.processTapButtonFollow(
            //     widget.userProfile.id, widget.folow.followers);
          },
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, left: 50, right: 50),
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black87, style: BorderStyle.solid, width: 1,),
                gradient: LinearGradient(
                  colors: [Color(0xFFFFE0DF), Color(0xFFE1F6F4)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.isFollowed ? "Unfollow" : "Follow",
                style: const TextStyle(
                  fontSize: 15,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isPhoto = true;
                  });
                },
                icon: Icon(
                  Icons.photo,
                  size: 25,
                  color: isPhoto ? primary : black,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    isPhoto = false;
                  });
                },
                icon: Icon(
                  Icons.play_circle,
                  size: 30,
                  color: !isPhoto ? primary : black,
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: isPhoto
              ? Expanded(
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: List.generate(mePostList.length, (index) {
                      return Container(
                        width: (size.width - 60) / 2,
                        height: (size.width - 60) / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(mePostList[index]),
                                fit: BoxFit.cover)),
                      );
                    }),
                  ),
                )
              : Expanded(
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: List.generate(meVideoList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          playVideo(context, meVideoList[index]['videoUrl']);
                        },
                        child: Container(
                          width: (size.width - 60) / 2,
                          height: (size.width - 60) / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image:
                                      NetworkImage(meVideoList[index]['img']),
                                  fit: BoxFit.cover)),
                          child: Center(
                            child: Icon(
                              Icons.play_circle_outline,
                              size: 40,
                              color: white,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
        )
      ],
    );
  }

  playVideo(BuildContext context, videoUrl) {
    _controller = VideoPlayerController.network(videoUrl);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}
