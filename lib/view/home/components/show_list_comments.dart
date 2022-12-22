import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../handle/handle_value.dart';
import '../../../models/comment.dart';
import '../../../theme/colors.dart';

class ShowListComments extends StatelessWidget {
  const ShowListComments({
    Key? key,
    required this.comments,
  }) : super(key: key);
  final Iterable<Comment> comments;

  @override
  Widget build(BuildContext context) {
    final ItemScrollController scrollController = ItemScrollController();
    return Expanded(
      child: ScrollablePositionedList.builder(
        scrollDirection: Axis.vertical,
        initialScrollIndex: comments.length,
        itemScrollController: scrollController,
        itemCount: comments.length,
        itemBuilder: (BuildContext context, int index) {
          DateTime date = DateTime.parse(
              comments.elementAt(index).date.toDate().toString());
          return Column(
            children: [
              // Container(
              //   padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              //   child: FutureBuilder<InfoUserCuaSinh?>(
              //       future:
              //           FireBaseUsers.getUser(comments.elementAt(index).user),
              //       builder: (context, snapshot) {
              //         print(snapshot.runtimeType);
              //         if (snapshot.connectionState == ConnectionState.waiting) {
              //           return CircularProgressIndicator();
              //         }
              //         if (snapshot.hasError) {
              //           // print("Has erro: ${snapshot.error}");
              //           return Text("Has erro: ${snapshot.error}");
              //         }
              //         if (snapshot.hasData) {
              //           final user = snapshot.data!;
              //           // print("Debugs at here: ${snapshot}");

              //           return Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               CircleAvatar(
              //                 backgroundImage: NetworkImage(user.urlImage),
              //               ),
              //               const SizedBox(
              //                 width: 25,
              //               ),
              //               Container(
              //                 // color: red,
              //                 width: 260,
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       user.fullName,
              //                       style:
              //                           TextStyle(fontSize: 18, color: black),
              //                     ),
              //                     const SizedBox(height: 3),
              //                     Text(
              //                       differenceInCalendarDaysLocalization(
              //                           date, context),
              //                       style: TextStyle(
              //                           fontSize: 14,
              //                           color: black.withOpacity(0.8)),
              //                     ),
              //                     const SizedBox(
              //                       height: 12,
              //                     ),
              //                     Text(comments.elementAt(index).contents),
              //                     const SizedBox(
              //                       height: 12,
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         InkWell(
              //                           onTap: () {},
              //                           child: Text(
              //                             "Reply",
              //                             style: TextStyle(
              //                                 color: Yellow, fontSize: 18),
              //                           ),
              //                         ),
              //                         InkWell(
              //                           onTap: () {},
              //                           child: Icon(
              //                             Icons.favorite,
              //                             color: white,
              //                             size: 20,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           );
              //         }

              //         return Text("Dont has data!");
              //       }),
              // ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
