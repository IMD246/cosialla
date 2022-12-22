import 'package:flutter/material.dart';

Future<void> SettingProfile(BuildContext context) {
  return showModalBottomSheet<void>(
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height/2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
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
                Navigator.pop(context);
                // context.read<AuthBloc>().add(AuthEventLogout());
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
