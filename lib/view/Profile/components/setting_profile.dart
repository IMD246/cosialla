import 'package:flutter/material.dart';

import '../../../bloc/LoginBloc/auth_bloc.dart';
import '../../../bloc/LoginBloc/auth_event.dart';
import '../../../models/user_profile.dart';

Future<dynamic> SettingProfile(
  BuildContext context,
  UserProfile userProfile,
  AuthBloc authBloc,
) {
  return showModalBottomSheet<bool>(
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height / 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext c) {
      return Container(
        margin: const EdgeInsets.only(top: 14, left: 20, right: 20),
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              leading: Icon(Icons.account_circle),
              title: const Text("Thông tin cá nhân"),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.key_rounded),
              title: const Text("Tài khoản"),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.privacy_tip_rounded),
              title: const Text("Quyền riêng tư"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                authBloc.add(
                  AuthEventLogout(
                    userProfile: userProfile,
                  ),
                );
                Navigator.of(c).pop();
              },
              leading: Icon(Icons.logout),
              title: const Text("Đăng xuất"),
            ),
            Divider(),
          ],
        ),
      );
    },
  );
}
