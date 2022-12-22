import 'package:flutter/material.dart';
import 'package:social_ui_kit/utilities/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String title,
  String text,
) {
  return showGenericDialog<void>(
    context: context,
    title: title,
    content: text,
    optionsBuilder: () => {
      "Ok": null,
    },
  );
}
