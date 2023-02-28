import 'package:flutter/material.dart';

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
    required Function confirmAction}) {
  Widget confirmButton = TextButton(
    child: const Text(
      "Confirm",
      style: TextStyle(color: Colors.green),
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
