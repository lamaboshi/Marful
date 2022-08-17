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

      // content: TextFieldWidget(
      //   obscureText: false,prefIcon: Icons.border_color,
      //   type: TextInputType.name,
      // ),
      actions: [
        TextFieldWidget(
          obscureText: false,
          prefIcon: Icons.border_color,
          type: TextInputType.name,
          label: 'name'.tr,
        ),
        TextFieldWidget(
          obscureText: false,
          prefIcon: Icons.border_color,
          type: TextInputType.name,
          label: 'passeword'.tr,
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.orange),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          child: const Center(child: Text('Add'.tr)),
        ),
      ],
    );
  }
}
