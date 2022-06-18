

import 'package:flutter/material.dart';

import '../values/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.type,
      required this.label,
      required this.hint,
      required this.prefIcon,
      this.postIcon})
      : super(key: key);

  
  final TextInputType type;
  final String label;
  final String hint;
  final IconData prefIcon;
  final IconData? postIcon;
@override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:type,
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
          border:const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.orange, width: 1.5),
          ),
          contentPadding:const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.orange, width: 1.5),
          ),
          focusedBorder:const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.orange, width: 1.5),
          )),
    );
  }
}
