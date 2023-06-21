import 'package:flutter/material.dart';

class TerciaryButton extends StatelessWidget {
  const TerciaryButton({
    Key? key,
    this.onPressed,
    required this.title,
    required this.textColor,
  }) : super(key: key);
  final void Function()? onPressed;
  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
