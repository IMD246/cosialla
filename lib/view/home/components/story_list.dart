import 'package:flutter/material.dart';

import '../../../models/story.dart';
import '../story_page.dart';

class StoriesList extends StatelessWidget {
  const StoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<Iterable<Story>?>(
    //   stream: FireBaseStories.getStories(), //get list of stories
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       //check erro
    //       return Text("Has erro: ${snapshot.error}");
    //     }
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       //connnecting
    //       return CircularProgressIndicator();
    //     }
    //     if (snapshot.hasData) {
    //       final listStories = snapshot.data!; //stories list
    //       //when got data
    //       return Row(
    //         children: List.generate(listStories.length, (index) {
    //           if (listStories.elementAt(index).user.isNotEmpty) {
    //             //check list not null
    //             return FutureBuilder<InfoUserCuaSinh?>(
    //               future: FireBaseUsers.getUser(
    //                   listStories.elementAt(index).user), //get user of this
    //               builder: (context, snapshot) {
    //                 if (snapshot.hasError) {
    //                   return Text("Has erro: ${snapshot.error}");
    //                 }
    //                 if (snapshot.connectionState == ConnectionState.waiting) {
    //                   return Center(child: CircularProgressIndicator());
    //                 }
    //                 if (snapshot.hasData) {
    //                   final user = snapshot.data!;
    //                   return Padding(
    //                     padding: const EdgeInsets.only(right: 30),
    //                     child: InkWell(
    //                       onTap: () {
    //                         //push navigate
    //                         Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                             builder: (context) => StoryPage(
    //                               story: listStories.elementAt(index),
    //                               user: user,
    //                             ),
    //                           ),
    //                         );
    //                       },
    //                       child: Container(
    //                         width: 58,
    //                         height: 58,
    //                         decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             image: DecorationImage(
    //                                 image: NetworkImage(user.urlImage),
    //                                 fit: BoxFit.cover)),
    //                       ),
    //                     ),
    //                   );
    //                 }
    //                 return Text("Dont has data!");
    //               },
    //             );
    //           }
    //           return Text("Dont has data!");
    //         }),
    //       );
    //     }
    //     //exception
    //     return Text("Dont has data!");
    //   },
    // );
    return Container();
  }
}
