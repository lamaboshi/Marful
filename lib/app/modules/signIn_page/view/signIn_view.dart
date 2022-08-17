import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/signIn_page/controllers/signIn_controller.dart';

import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

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
                  child: Form(
                    key: controller.form,
                    child: Column(
                      children: [
                        //Sign In to your account
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'SignIntoyouraccount'.tr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w500),
                          ),
                        ),
                        //Email
                        TextFieldWidget(
                          validator: controller.forceValue,
                          obscureText: false,
                          type: TextInputType.emailAddress,
                          label: 'Email'.tr,
                          hint: "hy@gmail.com",
                          prefIcon: Icons.email,
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                        ),
                        //////////passeword
                        Obx(() {
                          return TextFieldWidget(
                            validator: controller.forceValue,
                            type: TextInputType.visiblePassword,
                            label: 'Passeword'.tr,
                            hint: '***',
                            obscureText: !controller.isShown.value,
                            onChanged: (value) {
                              controller.email.value = value;
                            },
                          );
                        }),
                        //////////passeword
                        Obx(() {
                          return TextFieldWidget(
                            validator: controller.forceValue,
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
                          height: 20,
                        ),
                        //Forgot Your Passeword?
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Get.rootDelegate.toNamed(Routes.Password);
                            },
                            child: const Text(
                              'Forgot Your Passeword?',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ),
                        ),
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
                            if (controller.form.currentState!.validate()) {
                              controller.logIn();
                            }
                          },
                          child: Text(
                            'ForgotYourPasswod'.tr,
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),

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
                            if (controller.form.currentState!.validate()) {
                              controller.logIn();
                            }
                          },
                          child: Text(
                            "signin".tr,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.rootDelegate.toNamed(Routes.FirstSplash);
                          },
                          // ignore: sort_child_properties_last
                          child: Text('CreateYourAccount?'.tr),
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                        )
                      ],
                    ),
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
