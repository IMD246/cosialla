import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/user_profile.dart';
import '../theme/colors.dart';
import 'Profile/profile_page.dart';
import 'home/home_page.dart';
import 'saved_page.dart';
import 'upload/upload_post_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key, required this.userProfile}) : super(key: key);
  final UserProfile userProfile;

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  bool isVisible = true;
  late final PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: activeTab);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getBottomAppBar(),
      floatingActionButton: getFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: getBody(),
    );
  }

  Widget getBody() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        HomePage(),
        Container(),
        // ChatPage(
        //   userProfile: widget.userProfile,
        // ),
        // ,
        SavedPage(),
        ProfilePage(
          userProfile: widget.userProfile,
        )
      ],
    );
  }

  Widget getBottomAppBar() {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        height: 64.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                if (activeTab != 0) {
                  setState(() {
                    activeTab = 0;
                    pageController.jumpToPage(activeTab);
                  });
                }
              },
              child: Icon(
                Icons.home,
                size: 25.h,
                color: activeTab == 0 ? primary : black,
              ),
            ),
            InkWell(
              onTap: () {
                if (activeTab != 1) {
                  setState(() {
                    activeTab = 1;
                    pageController.jumpToPage(activeTab);
                  });
                }
              },
              child: Icon(
                Icons.messenger_outlined,
                size: 22.h,
                color: activeTab == 1 ? primary : black,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 8,
            ),
            InkWell(
              onTap: () {
                if (activeTab != 2) {
                  setState(() {
                    activeTab = 2;
                    pageController.jumpToPage(activeTab);
                  });
                }
              },
              child: Icon(
                Icons.favorite,
                size: 25.h,
                color: activeTab == 3 ? primary : black,
              ),
            ),
            InkWell(
              onTap: () {
                if (activeTab != 3) {
                  setState(() {
                    activeTab = 3;
                    pageController.jumpToPage(activeTab);
                  });
                }
              },
              child: Icon(
                Icons.account_circle_rounded,
                size: 25.h,
                color: activeTab == 4 ? primary : black,
              ),
            ),
          ],
        ),
      ),
      shape: CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      notchMargin: 5.0,
    );
  }

  Widget getFloatingButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return UploadPostPage(
                userProfile: widget.userProfile,
              );
            },
          ),
        );
      },
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 1),
            ),
          ], color: black, borderRadius: BorderRadius.circular(23)),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Center(
              child: Icon(
                Icons.add_rounded,
                color: white,
                size: 26.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
