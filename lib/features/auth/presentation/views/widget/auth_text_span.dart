import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthTextSpan extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final String pageName;
  const AuthTextSpan({
    super.key,
     required this.text, this.onTap, required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text:pageName,
            recognizer: TapGestureRecognizer()
              ..onTap = onTap,
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
