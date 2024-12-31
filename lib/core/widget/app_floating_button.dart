import 'package:flutter/material.dart';

class AppFloatingButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  const AppFloatingButton({super.key, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.green,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
