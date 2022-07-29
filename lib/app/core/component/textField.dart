// ignore: file_names
import 'package:flutter/material.dart';

import '../values/app_colors.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key,
    required this.type,
    this.label,
    this.hint,
    this.prefIcon,
    this.onChanged,
    this.suffixIcon,
    required this.obscureText,
  }) : super(key: key);

  final TextInputType type;
  final String? label;
  final String? hint;
  final IconData? prefIcon;
  final IconButton? suffixIcon;
  final Function(String)? onChanged;
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: type,
      cursorColor: AppColors.blue,
      cursorHeight: 20,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.grey[350]),
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(
          prefIcon,
          color: AppColors.orange,
        ),
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.orange, width: 1.5),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.orange, width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.orange, width: 1.5),
        ),
      ),
    );
  }
}
