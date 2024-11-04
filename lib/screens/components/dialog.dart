import 'package:flutter/material.dart';

void showErrorDialog({
  required BuildContext context,
  String? title,
  String? message,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title ?? "Error"),
      content: Text(message ?? ""),
      actions: [
        FilledButton(
          child: const Text("Okay"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
