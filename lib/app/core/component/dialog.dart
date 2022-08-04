import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/component/textField.dart';

import '../values/app_colors.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.all(13),
      title: const Text("Enter code"),
      content: TextFieldWidget(
        obscureText: false,prefIcon: Icons.border_color,
        type: TextInputType.name,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.orange),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          child: const Center(child: Text('Add')),
        ),
      ],
    );
  }
}
