import 'package:flutter/material.dart';

import '../values/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.Type,
      required this.Label,
      required this.Hint,
      required this.PrefIcon,
      this.PostIcon})
      : super(key: key);

  @override
  final TextInputType Type;
  final String Label;
  final String Hint;
  final IconData PrefIcon;
  final IconData? PostIcon;

  Widget build(BuildContext context) {
    return TextField(
      keyboardType:Type,
      cursorColor: AppColors.blue,
      cursorHeight: 20,
      autofocus: false,
      decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.grey[350]),
          labelText: Label,
          hintText: Hint,
          prefixIcon: Icon(
            PrefIcon,
            color: AppColors.orange,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.orange, width: 1.5),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.orange, width: 1.5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.orange, width: 1.5),
          )),
    );
  }
}
