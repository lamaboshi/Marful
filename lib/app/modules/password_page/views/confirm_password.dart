import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/password_controller.dart';

class Confirmpassword extends GetView<PasswordController> {
  const Confirmpassword({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back,
                        size: 30, color: AppColors.blue)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: Text(
                  'Reset  Your Password',
                  style: TextStyle(fontSize: 22, color: AppColors.blue),
                ),
              ),
            ],
          ),
          Card(
              elevation: 10,
              child: Container(
                  width: width / 2,
                  height: height / 2,
                  child: Image.asset('assets/images/Social media (1).gif'))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Enter your new password below',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (newText) {
              controller.resrtpassword.value = newText;
            },
            keyboardType: TextInputType.emailAddress,
            cursorColor: AppColors.blue,
            cursorHeight: 20,
            autofocus: false,
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey),
                labelText: ' Password',
                hintText: "New password",
                prefixIcon: Icon(
                  Icons.lock_open_outlined,
                  color: AppColors.orange,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange, width: 1.5),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange, width: 1.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange, width: 1.5),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (newText) {
              controller.password.value = newText;
            },
            keyboardType: TextInputType.emailAddress,
            cursorColor: AppColors.blue,
            cursorHeight: 20,
            autofocus: false,
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey),
                labelText: 'Confirm',
                hintText: "Comfirmpassword",
                prefixIcon: Icon(
                  Icons.lock,
                  color: AppColors.orange,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange, width: 1.5),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange, width: 1.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange, width: 1.5),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.blue),
                fixedSize:
                    MaterialStateProperty.all(const Size.fromWidth(150))),
            onPressed: () async {
              if (controller.password.value.length ==
                  controller.resrtpassword.value.length) {
                await controller.resetPassword();
              } else {
                QPanel(
                    alignment: Alignment.bottomCenter,
                    width: 40,
                    height: 40,
                    child: Container(
                      child: Text(
                        'Comfirm from the enter value',
                        style: TextStyle(color: Colors.red),
                      ),
                    )).show();
              }
            },
            child: const Text(
              "SUBMIT",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
