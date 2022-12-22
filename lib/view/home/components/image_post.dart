// import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../../utilities/image/get_real_size_image.dart';

class PostImage extends StatelessWidget {
  PostImage({Key? key, required this.urlImage}) : super(key: key);

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: GetRealSize.getSize(urlImage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          final widthScreen = MediaQuery.of(context).size.width;
          final height =
              snapshot.data!.height / (snapshot.data!.width / widthScreen);
          return Container(
            width: double.infinity,
            height: height.toDouble(),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(urlImage),
                  fit: BoxFit.fitHeight,
                ),
                borderRadius: BorderRadius.circular(6)),
          );
        }
        return Text("Dont has data!");
      },
    );
  }
}
