import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/signUp_page/controllers/signUp_controller.dart';
import 'package:marful/sheard/util.dart';

import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';

class SignUpCompanyPage extends GetView<SignUpController> {
  const SignUpCompanyPage({Key? key}) : super(key: key);

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
                        child: Obx(
                          () => ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: controller.stringPickImage.value.isEmpty
                                ? Image.asset(
                                    'assets/images/person.png',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Utility.imageFromBase64String(
                                    controller.stringPickImage.value, 100, 100),
                          ),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                        onTap: () {
                          controller.pickImageFun();
                        },
                        child: const Text('Add Your Photo..')),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, right: 20),
                      child: Column(
                        children: [
                          //Name
                          TextFieldWidget(
                            obscureText: false,
                            onChanged: (value) {
                              controller.company.value.name = value;
                            },
                            type: TextInputType.name,
                            label: 'Company Name',
                            hint: "narin",
                            prefIcon: Icons.person,
                          ),

                          //Phone
                          TextFieldWidget(
                            obscureText: false,
                            onChanged: (value) {
                              controller.company.value.phone = value;
                            },
                            type: TextInputType.number,
                            label: 'PhoneNumber',
                            hint: "099717424666",
                            prefIcon: Icons.phone,
                          ),

                          //TelePhone
                          TextFieldWidget(
                            obscureText: false,
                            onChanged: (value) {
                              controller.company.value.telePhone = value;
                            },
                            type: TextInputType.number,
                            label: 'TelePhone',
                            hint: "5225356",
                            prefIcon: Icons.phone,
                          ),

                          ///Description

                          TextFieldWidget(
                            obscureText: false,
                            onChanged: (value) {
                              controller.company.value.description = value;
                            },
                            type: TextInputType.name,
                            label: 'Description',
                            hint: "i am gdfsdfj,gh",
                            prefIcon: Icons.description,
                          ),

                          //Address
                          TextFieldWidget(
                            obscureText: false,
                            onChanged: (value) {
                              controller.company.value.address = value;
                            },
                            type: TextInputType.none,
                            label: 'location',
                            hint: "aleppo",
                            prefIcon: Icons.location_on,
                          ),

                          //Email
                          TextFieldWidget(
                            obscureText: false,
                            onChanged: (value) {
                              controller.company.value.email = value;
                            },
                            type: TextInputType.emailAddress,
                            label: 'Email',
                            hint: "hy@gmail.com",
                            prefIcon: Icons.email,
                          ),

                          ////////Passeword
                          Obx(() {
                            return TextFieldWidget(
                              onChanged: (value) {
                                controller.company.value.password = value;
                              },
                              obscureText: !controller.isShownCompany.value,
                              type: TextInputType.visiblePassword,
                              label: 'Passeword',
                              hint: "***",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isShownCompany.value =
                                      !controller.isShownCompany.value;
                                },
                                icon: Icon(
                                  controller.isShownCompany.value
                                      ? Icons.remove_red_eye
                                      : CupertinoIcons.eye_slash_fill,
                                  color: Colors.black,
                                ),
                              ),
                              prefIcon: Icons.key,
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
                              Get.dialog(AlertDialog(
                                content: Row(
                                  children: const [
                                    Icon(
                                      Icons.info_outlined,
                                      color: AppColors.orange,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        'Are you sure want to Save Your Data ?'),
                                  ],
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                actionsPadding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 20),
                                actions: [
                                  Row(children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        controller.isSaveData.value = true;
                                        controller.signUpCompany();
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  AppColors.blue),
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: const Text('Yes'),
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: () {
                                        controller.isSaveData.value = false;
                                        controller.signUpCompany();
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  AppColors.blue),
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: const Text('Cancel'),
                                    ),
                                  ]),
                                ],
                              ));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
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
