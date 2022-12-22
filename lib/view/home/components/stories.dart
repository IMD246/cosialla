import 'package:flutter/material.dart';
import 'package:social_ui_kit/view/home/components/story_list.dart';
import 'add_new_story.dart';

class Stories extends StatelessWidget {
  const Stories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //logo
        Text(
          "Feed",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        //Stories
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              //Add New Story
              AddNewStory(),
              SizedBox(
                width: 30,
              ),
              //List of stories
              StoriesList(),
            ],
          ),
        )
      ],
    );
  }
}




