// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/signUp_page/controllers/signUp_controller.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';

class SignUpUserPage extends GetView<SignUpController> {
  const SignUpUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(children: [
        Image(
          height: height * 1.03 / 3,
          fit: BoxFit.fill,
          image: const AssetImage(
            "assets/images/signin.png",
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: height * 0.93 / 3),
          height: height * 4 / 3,
          width: double.infinity,
          child: Card(
            elevation: 15,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CircleAvatar(
                        radius: height * 80 / height,
                        backgroundImage:
                            const AssetImage('assets/images/person.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                        onTap: () {
                          controller.pickImageFun();
                        },
                        child: Text('AddYourPhoto'.tr)),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, right: 20),
                      child: Form(
                        key: controller.userForm,
                        child: Column(
                          children: [
                            //Name
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                controller.user.value.name = value;
                              },
                              type: TextInputType.name,
                              label: 'Name'.tr,
                              hint: "Haya Eid",
                              validator: controller.forceValue,
                              prefIcon: Icons.person,
                            ),
                            //UserName
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                controller.user.value.userName = value;
                              },
                              type: TextInputType.name,
                              label: 'UserName'.tr,
                              hint: "Haya ",
                              prefIcon: Icons.person,
                              validator: controller.forceValue,
                            ),
                            //Age
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                controller.user.value.age = int.parse(value);
                              },
                              type: TextInputType.number,
                              label: 'Age'.tr,
                              hint: "21 ",
                              prefIcon: Icons.description,
                              validator: controller.forceValue,
                            ),
                            //Phone
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                controller.user.value.phone = value;
                              },
                              type: TextInputType.number,
                              label: 'PhoneNumber'.tr,
                              hint: "099717424666 ",
                              prefIcon: Icons.phone,
                              validator: controller.forceValue,
                            ),
                            //address
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                //        controller.user.value.l= value;
                              },
                              type: TextInputType.number,
                              label: 'location'.tr,
                              hint: "aleppo ",
                              prefIcon: Icons.location_on,
                              validator: controller.forceValue,
                            ),
                            //PayBal
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                controller.user.value.paypal = value;
                              },
                              type: TextInputType.number,
                              label: 'PayBal'.tr,
                              hint: "hsd235dfgdf ",
                              prefIcon: Icons.paypal,
                              validator: controller.forceValue,
                            ),

                            //Email
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                controller.user.value.email = value;
                              },
                              type: TextInputType.emailAddress,
                              label: 'Email'.tr,
                              hint: "hy@gmail.com ",
                              prefIcon: Icons.email,
                              validator: controller.forceValue,
                            ),
                            ////////Passeword
                            Obx(() {
                              return TextFieldWidget(
                                onChanged: (value) {
                                  controller.user.value.password = value;
                                },
                                type: TextInputType.visiblePassword,
                                obscureText: !controller.isShownUser.value,
                                label: 'Passeword'.tr,
                                hint: "***",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.isShownUser.value =
                                        !controller.isShownUser.value;
                                  },
                                  icon: Icon(
                                    controller.isShownUser.value == true
                                        ? Icons.remove_red_eye
                                        : CupertinoIcons.eye_slash_fill,
                                    color: Colors.black,
                                  ),
                                ),
                                prefIcon: Icons.key,
                                validator: controller.forceValue,
                              );
                            }),
                            const SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(AppColors.blue),
                                  fixedSize: MaterialStateProperty.all(
                                      const Size.fromWidth(150))),
                              onPressed: () async {
                                if (controller.userForm.currentState!
                                    .validate()) {
                                  Get.dialog(AlertDialog(
                                    content: Row(
                                      children: [
                                        const Icon(
                                          Icons.info_outlined,
                                          color: AppColors.orange,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text('AreyousurewanttoSaveYourData'.tr),
                                      ],
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 10),
                                    actionsPadding: const EdgeInsets.fromLTRB(
                                        15, 10, 15, 20),
                                    actions: [
                                      Row(children: [
                                        ElevatedButton(
                                          onPressed: () async {
                                            controller.isSaveData.value = true;
                                            controller.signUpUser();
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      AppColors.blue),
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white)),
                                          child: Text('Yes'.tr),
                                        ),
                                        const Spacer(),
                                        ElevatedButton(
                                          onPressed: () async {
                                            controller.isSaveData.value = false;
                                            if (controller.user.value.age! >
                                                    1 &&
                                                controller.user.value.age! <
                                                    100) {
                                              QPanel(
                                                      duration: const Duration(
                                                          seconds: 2),
                                                      child: const Center(
                                                        child: Text(
                                                          'pelase Enter Your Really Age',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.topCenter)
                                                  .show();
                                            } else {
                                              controller.signUpUser();
                                            }
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      AppColors.blue),
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white)),
                                          child: Text('Cancel'.tr),
                                        ),
                                      ]),
                                    ],
                                  ));
                                }
                              },
                              child: Text(
                                "SignUp".tr,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
