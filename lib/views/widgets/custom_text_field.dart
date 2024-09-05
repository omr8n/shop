import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.keyboardType,
  });
  final String? Function(String?)? validator;
  final String hint;
  final int maxLines;
  final TextInputType? keyboardType;

  final void Function(String? value)? onSaved;

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      //  (value) {
      //   if (value == null ||
      //       value.isEmpty ||
      //       value.trim().length <= 1 ||
      //       value.trim().length > 50) {
      //     return 'Field is required ';
      //   } else {
      //     return null;
      //   }
      // },
      // cursorColor: kPrimaryColor,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        // focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}
