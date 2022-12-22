import 'package:flutter/material.dart';
import 'package:social_ui_kit/theme/colors.dart';

class AddNewStory extends StatelessWidget {
  const AddNewStory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xFFFFE0DF), Color(0xFFE1F6F4)],
          ),
        ),
        child: InkWell(
          onTap: () {
            //push navigate
          },
          child: Center(
            child: Icon(
              Icons.add,
              color: black,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}