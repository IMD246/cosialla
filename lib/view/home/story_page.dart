import 'package:flutter/material.dart';

import '../../models/info_user_cua_sinh.dart';
import '../../models/story.dart';
import '../../theme/colors.dart';
import 'components/send_mess_make_love_story.dart';
import 'components/user_content_story.dart';

class StoryPage extends StatefulWidget {
  final InfoUserCuaSinh user;
  final Story story;
  // bool isLove;

  StoryPage({
    Key? key,
    required this.user,
    required this.story,
  }) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with TickerProviderStateMixin {
  late AnimationController progressBarController;
  bool isStopped = false;
  TextEditingController commentController = TextEditingController();
  @override
  void initState() {
    progressBarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {
          if (progressBarController.value == 1) {
            Navigator.pop(context);
          }
        });
      });
    progressBarController.animateTo(1.0);

    super.initState();
  }

  @override
  void dispose() {
    progressBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _hieght = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black26,
      body: InkWell(
        onLongPress: () {},
        onTap: () {
          Navigator.pop(context); //pop this page
        },
        onDoubleTap: () {
          setState(() {
            isStopped = !isStopped;
            progressBarController.stop(canceled: isStopped);
          });
        },
        child: SafeArea(
          child: Stack(
            children: [
              //image story
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.story.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              //progress bar
              Padding(
                padding: const EdgeInsets.all(12),
                child: LinearProgressIndicator(
                  color: white,
                  backgroundColor: darkWhite,
                  value: progressBarController.value,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
              //user and content of story
              UserAndContentStory(
                  context: context, user: widget.user, story: widget.story),
              //send a message to this user or make love story
              SendMessAndLoveStory(
                  hieght: _hieght,
                  width: _width,
                  idStory: widget.story.id,
                  loves: widget.story.loves),
            ],
          ),
        ),
      ),
    );
  }
}
