import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/LoginBloc/auth_bloc.dart';
import '../../models/user_profile.dart';
import '../../services/firebase_auth_provider.dart';
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
        preferredSize: Size.fromHeight(180.h),
      ),
      body: BodyProfilePage(
        userProfile: widget.userProfile,
      ),
    );
  }

  Widget getAppBar() {
    FirebaseAuthProvider firebaseAuthProvider =
        FirebaseAuthProvider.getInstance();
    return AppBar(
      elevation: 0,
      backgroundColor: primaryLight,
      flexibleSpace: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 8.0.h, right: 12.0.w),
                child: IconButton(
                  onPressed: () async {
                    await SettingProfile(context, widget.userProfile,
                            context.read<AuthBloc>())
                        .then((value) {
                      if (firebaseAuthProvider.currentUser == null) {
                        Navigator.popUntil(context, (route) => false);
                      }
                    });
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
                  Container(
                    width: 75.w,
                    height: 75.h,
                    child: Center(
                      child: Container(
                        width: 70.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.w),
                          image: DecorationImage(
                            image: widget.userProfile.urlImage != null
                                ? NetworkImage(
                                    widget.userProfile.urlImage ?? "",
                                  )
                                : Image.asset("assets/images/defaultImage.png")
                                    .image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    widget.userProfile.fullName,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
