import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFFA4A0C)),
        foregroundColor: MaterialStateProperty.all(Color(0xFFFFFFFF)),
        fixedSize: MaterialStateProperty.all(const Size(315, 60)),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
      child: Text(title),
    );
  }
}
