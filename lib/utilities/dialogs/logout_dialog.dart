import 'package:flutter/material.dart';
import 'package:social_ui_kit/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: "Logout Button",
    content: "Logout",
    optionsBuilder: () => {
      "": false,
      "logout": true,
    },
  ).then(
    (value) => value ?? false,
  );
}
