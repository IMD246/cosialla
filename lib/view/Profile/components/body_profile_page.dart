import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../data/me_post_json.dart';
import '../../../models/user_profile.dart';
import '../../../services/UserProfileScreen/firebase/firebase_follow.dart';
import '../../../theme/colors.dart';
import 'followers.dart';
import 'following.dart';
import 'posts.dart';

class BodyProfilePage extends StatefulWidget {
  BodyProfilePage({Key? key, required this.userProfile}) : super(key: key);
  final UserProfile userProfile;
  @override
  State<BodyProfilePage> createState() => _BodyProfilePageState();
}

class _BodyProfilePageState extends State<BodyProfilePage> {
  late final FirebaseFollow firebaseFollowers;
  late VideoPlayerController _controller;
  bool isPhoto = true;

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

  @override
  void initState() {
    super.initState();
    firebaseFollowers = FirebaseFollow();
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
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Posts(widget: widget),
              Followers(
                firebaseFollowers: firebaseFollowers,
                widget: widget,
              ),
              Following(
                firebaseFollowers: firebaseFollowers,
                widget: widget,
              )
            ],
          ),
          SizedBox(
            height: 30,
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
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          isPhoto
              ? Wrap(
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
                )
              : Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: List.generate(
                    meVideoList.length,
                    (index) {
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
                    },
                  ),
                )
        ],
      ),
    );
  }
}
