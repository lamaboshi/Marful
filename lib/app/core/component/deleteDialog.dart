import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../values/app_colors.dart';

class DeleteDialogWidget extends StatelessWidget {
   DeleteDialogWidget({Key? key,required Function()? delFunction,}) : super(key: key);
Function()? delFunction;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          Icon(
            Icons.info_outlined,
            color: AppColors.orange,
          ),
          const SizedBox(
            width: 5,
          ),
          Text('Are you sure to delete?'),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      actionsPadding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
      actions: [
        Row(children: [
          ElevatedButton(
            onPressed: () {delFunction;
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            child: Text('Delete'),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            child: Text('Cancel'),
          ),
        ]),
      ],
    );
  }
}
