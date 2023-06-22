import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:easy_eats/common/color/color_palette.dart';

class InputTextFormField extends StatelessWidget {
  final String name;
  final String labelText;
  final bool obscureText;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;
  const InputTextFormField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.onChanged,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) => onChanged,
      validator: validator,
      obscureText: obscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        counterText: '',
        labelText: labelText,
        labelStyle: TextStyle(
          color: ColorPalette.greyIcons,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorPalette.greyIcons,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorPalette.errorSystem,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorPalette.errorSystem,
          ),
        ),
      ),
    );
  }
}
