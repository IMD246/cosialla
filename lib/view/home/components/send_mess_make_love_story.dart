import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class SendMessAndLoveStory extends StatefulWidget {
  const SendMessAndLoveStory(
      {Key? key,
      required this.hieght,
      required this.width,
      this.idStory,
      required this.loves})
      : super(key: key);
  final double hieght;
  final double width;
  final idStory;
  final List<dynamic> loves;

  @override
  State<SendMessAndLoveStory> createState() => _SendMessAndLoveStoryState();
}

class _SendMessAndLoveStoryState extends State<SendMessAndLoveStory> {
  TextEditingController sendMessController = TextEditingController();
  late bool islove;

  @override
  void initState() {
    islove = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FireBaseStories.checkIsLove(widget.loves).then((value) {
    //   setState(() {
    //     islove = value;
    //   });
    // });
    return Positioned(
      top: widget.hieght - 88,
      left: 12,
      child: Row(
        children: [
          //input to send message for user of story
          Container(
            width: MediaQuery.of(context).size.width * 5 / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.white.withOpacity(0.5),
            ),
            child: TextFormField(
              controller: sendMessController,
              cursorColor: Colors.black54,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width / 2) / 8),
                hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                hintText: "Send Message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: BorderSide(
                      width: 0.3, color: Color(0xFFE5E5E5).withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: BorderSide(
                      width: 0.3, color: Color(0xFFE5E5E5).withOpacity(0.5)),
                ),
              ),
            ),
          ),
          //make love this story or share this
          Container(
            padding: const EdgeInsets.only(right: 12),
            width: widget.width * 3 / 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //love here
                InkWell(
                  onTap: () {
                    // setState(() {
                    //   FireBaseStories.processLove(widget.idStory, widget.loves);
                    // });
                  },
                  child: Icon(
                    islove ? CupertinoIcons.heart_solid : CupertinoIcons.heart,
                    color: islove ? red : Colors.white54,
                    size: 36,
                    shadows: [
                      BoxShadow(
                          color: grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 15,
                          offset: Offset(0, 1))
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                //share here
                InkWell(
                  onTap: () {
                    setState(() {
                      // widget.isComment = !widget.isComment;
                    });
                  },
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
