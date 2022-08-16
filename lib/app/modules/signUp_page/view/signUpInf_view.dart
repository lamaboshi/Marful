import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/signUp_page/controllers/signUp_controller.dart';

import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';

class SignUpInfluencer extends GetView<SignUpController> {
  const SignUpInfluencer({Key? key}) : super(key: key);

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
                        onTap: () {}, child:  Text('SignUpCmpPH'.tr)),
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
                              controller.influencer.value.name = value;
                            },
                            type: TextInputType.name,
                            label: 'SignUpInfName'.tr,
                            hint: "Haya Eid",
                            prefIcon: Icons.person,
                          ),
                          //UserName
                          TextFieldWidget(
                            obscureText: false,
                            onChanged: (value) {
                              controller.influencer.value.userName = value;
                            },
                            type: TextInputType.name,
                            label: 'SignUpInfUserName'.tr,
                            hint: "Haya ",
                            prefIcon: Icons.person,
                          ),
                          //Description
                          TextFieldWidget(
                            obscureText: false,
                            onChanged: (value) {
                              controller.influencer.value.description = value;
                            },
                            type: TextInputType.name,
                            label: 'SignUpCmpDes'.tr,
                            hint: "I have so many bfghfccgbfg ",
                            prefIcon: Icons.description,
                          ),
                          //Phone
                          TextFieldWidget(
                            obscureText: false,
                            onChanged: (value) {
                              controller.influencer.value.phone = value;
                            },
                            type: TextInputType.number,
                            label: 'SignUpCmpMob'.tr,
                            hint: "099717424666 ",
                            prefIcon: Icons.phone,
                          ),
                          //address
                          TextFieldWidget(
                            obscureText: false,
                            onChanged: (value) {
                              controller.influencer.value.address = value;
                            },
                            type: TextInputType.name,
                            label: 'SignCmpUplocation'.tr,
                            hint: "aleppo ",
                            prefIcon: Icons.location_on,
                          ),
                          //PayBal
                          TextFieldWidget(
                            obscureText: false,
                            onChanged: (value) {
                              controller.influencer.value.paypal = value;
                            },
                            type: TextInputType.number,
                            label: 'SignUpInfPaybal'.tr,
                            hint: "hsd235dfgdf ",
                            prefIcon: Icons.paypal,
                          ),
                          //Email
                          TextFieldWidget(
                            obscureText: false,
                            onChanged: (value) {
                              controller.influencer.value.email = value;
                            },
                            type: TextInputType.emailAddress,
                            label: 'SignUpCmpEmail'.tr,
                            hint: "hy@gmail.com ",
                            prefIcon: Icons.email,
                          ),
                          ////////Passeword
                          Obx(() {
                            return TextFieldWidget(
                              onChanged: (value) {
                                controller.influencer.value.password = value;
                              },
                              obscureText: !controller.isShownInfluencer.value,
                              type: TextInputType.visiblePassword,
                              label: 'SignUpCmpPassword'.tr,
                              hint: "***",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isShownInfluencer.value =
                                      !controller.isShownInfluencer.value;
                                },
                                icon: Icon(
                                  controller.isShownInfluencer.value
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
                                  children: [
                                    Icon(
                                      Icons.info_outlined,
                                      color: AppColors.orange,
                                    ),
                                    const SizedBox(
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
                                      onPressed: () async {
                                        controller.isSaveData.value = true;
                                        await controller.signUpInfluencer();
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  AppColors.blue),
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: Text('Yes'),
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: () async {
                                        controller.isSaveData.value = false;
                                        await controller.signUpInfluencer();
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  AppColors.blue),
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: Text('Cancel'),
                                    ),
                                  ]),
                                ],
                              ));
                            },
                            child:  Text(
                              "SignUpCmp".tr,
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
