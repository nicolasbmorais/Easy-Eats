import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputTextFormField extends StatelessWidget {
  final String name;
  final String labelText;
  final bool obscureText;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;

  const InputTextFormField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.onChanged,
    required this.textEditingController,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: textEditingController,
      name: name,
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: (value) => onChanged,
      validator: validator,
      obscureText: obscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        counterText: '',
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xFF8B8B8B),
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF8B8B8B),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFF0000),
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFF0000),
          ),
        ),
      ),
    );
  }
}
