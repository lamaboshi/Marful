import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/signIn_page/controllers/signIn_controller.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';

class CompanyType extends GetView<SignInController> {
  const CompanyType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        //image
        Image(
          height: height * 1.03 / 3,
          fit: BoxFit.fill,
          image: const AssetImage(
            "assets/images/signin.png",
          ),
        ),
        //card with signUp information
        Container(
          padding: EdgeInsets.only(top: height * 0.93 / 3),
          height: height * 4 / 3,
          child: Card(
            elevation: 15,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      //Sign In to your account
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Add Your Permissions',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      QExpander(
                          expandChild: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: controller.typeCompanyList
                                  .map((e) => InkWell(
                                        onTap: () {
                                          controller.typeCompany.value = e;
                                          QOverlay.dismissLast();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            e,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.account_balance_wallet_sharp,
                                  color: AppColors.orange,
                                ),
                                SizedBox(width: 8),
                                Obx(() => Text(
                                    controller.typeCompany.value.isEmpty
                                        ? 'Company Type'
                                        : controller.typeCompany.value,
                                    style: TextStyle(fontSize: 18))),
                              ],
                            ),
                          )),
                      //Email
                      Obx(() {
                        return TextFieldWidget(
                          type: TextInputType.visiblePassword,
                          label: 'Passeword',
                          hint: '***',
                          obscureText: !controller.isShown.value,
                          onChanged: (value) {
                            controller.password.value = value;
                          },
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.isShown.value =
                                  !controller.isShown.value;
                            },
                            icon: Icon(
                              controller.isShown.value
                                  ? Icons.remove_red_eye
                                  : CupertinoIcons.eye_slash_fill,
                              color: Colors.black,
                            ),
                          ),
                          prefIcon: Icons.key,
                        );
                      }),

                      const SizedBox(
                        height: 80,
                      ),
                      //btn Sign In
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.blue),
                            fixedSize: MaterialStateProperty.all(
                                const Size.fromWidth(150))),
                        onPressed: () {
                          controller.logInTypeFun();
                        },
                        child: const Text(
                          "SignIn ",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
