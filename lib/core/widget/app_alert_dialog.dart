import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  final String content;

  const AppAlertDialog({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(content),
      title: const Center(
          child: Text(
        "Oops !!",
        style: TextStyle(color: Colors.red),
      )),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
