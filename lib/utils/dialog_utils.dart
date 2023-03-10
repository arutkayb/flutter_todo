import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/widgets/custom_text_input_widget.dart';

void showSafeSnackBar(BuildContext context,
    {required String content, Duration? duration}) {
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        behavior: SnackBarBehavior.floating,
        duration: duration ?? const Duration(seconds: 1),
      ),
    );
  }
}

void showSafeDialog(BuildContext context,
    {required String title, required String content}) {
  if (context.mounted) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
          );
        });
  }
}

void showSafeConfirmationDialog(BuildContext context,
    {required String title,
    required String content,
    String? confirmButtonText,
    required Function confirmAction}) {
  Widget confirmButton = TextButton(
    child: Text(
      confirmButtonText ?? "confirm".tr(),
      style: const TextStyle(color: Colors.green),
    ),
    onPressed: () {
      Navigator.pop(context);
      confirmAction();
    },
  );

  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  if (context.mounted) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              confirmButton,
              cancelButton,
            ],
          );
        });
  }
}

void showSafeChooseActionDialog(BuildContext context,
    {required String title,
    String? content,
    required String actionButton1,
    required Function action1,
    required String actionButton2,
    required Function action2}) {
  Widget action1Button = TextButton(
    child: Text(
      actionButton1,
      style: const TextStyle(color: Colors.green),
    ),
    onPressed: () {
      Navigator.pop(context);
      action1();
    },
  );

  Widget action2Button = TextButton(
    child: Text(actionButton2),
    onPressed: () {
      Navigator.pop(context);
      action2();
    },
  );

  if (context.mounted) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: content != null ? Text(content) : null,
            actions: [
              action1Button,
              action2Button,
            ],
          );
        });
  }
}

void showSafeChooseActionTextInputDialog(BuildContext context,
    {required String title,
    required String actionButton1,
    required Function action1,
    required List<CustomTextInputDetail> details}) {
  Widget action1Button = TextButton(
    child: Text(
      actionButton1,
      style: const TextStyle(color: Colors.green),
    ),
    onPressed: () {
      Navigator.pop(context);
      action1();
    },
  );

  Widget action2Button = TextButton(
    child: const Text("cancel").tr(),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  if (context.mounted) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: CustomTextInputWidget(details),
            actions: [
              action1Button,
              action2Button,
            ],
          );
        });
  }
}
