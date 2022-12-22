import 'package:flutter/material.dart';

import '../../models/user_profile.dart';
import '../../theme/colors.dart';
import 'components/body_profile_page.dart';
import 'components/setting_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.userProfile}) : super(key: key);
  final UserProfile userProfile;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(180),
      ),
      body: BodyProfilePage(
        userProfile: widget.userProfile,
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primaryLight,
      flexibleSpace: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(top: 8.0, right: 12.0),
                child: IconButton(
                  onPressed: () {
                    SettingProfile(context);
                  },
                  icon: Icon(Icons.menu),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   width: 75,
                  //   height: 75,
                  //   child: Center(
                  //     child: Container(
                  //       width: 70,
                  //       height: 70,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(30),
                  //         image: DecorationImage(
                  //           image: widget.userProfile.urlImage.isNotEmpty
                  //               ? NetworkImage(
                  //                   widget.userProfile.urlImage,
                  //                 )
                  //               : Image.asset("assets/images/defaultImage.png")
                  //                   .image,
                  //           fit: BoxFit.cover,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
          ],
        ),
      ),
    );
  }
}
