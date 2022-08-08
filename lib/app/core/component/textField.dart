// ignore: file_names
import 'package:flutter/material.dart';

import '../values/app_colors.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
    Key? key,
    required this.type,
    this.label,
    this.hint,
    this.prefIcon,
    this.onChanged,
    this.dufaltText,
    this.suffixIcon,
    required this.obscureText,
  }) : super(key: key);

  final TextInputType type;
  final String? label;
  final String? dufaltText;
  final String? hint;
  final IconData? prefIcon;
  final IconButton? suffixIcon;
  final Function(String)? onChanged;
  bool obscureText = false;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if ((widget.dufaltText?.isNotEmpty ?? false) ||
          (widget.dufaltText?.isNotEmpty ?? false)) {
        _controller.value = TextEditingValue(
          text: widget.dufaltText ?? '',

          ///prevent revesed text :!
          selection: TextSelection.collapsed(
            offset: widget.dufaltText?.length ?? 0,
          ),
        );
      }
    });
    return TextField(
      maxLines: 1,
      obscureText: widget.obscureText,
      controller: _controller,
      onChanged: widget.onChanged,
      keyboardType: widget.type,
      cursorColor: AppColors.blue,
      cursorHeight: 20,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.grey[350]),
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: Icon(
          widget.prefIcon,
          color: AppColors.orange,
        ),
        suffixIcon: widget.suffixIcon,
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
