import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/signUp_page/controllers/signUp_controller.dart';
import 'package:marful/app/routes/app_pages.dart';
import 'package:marful/app/data/model/infulonser.dart';
import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';

class SignUpInfluencer extends GetView<SignUpController> {
  const SignUpInfluencer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
  Infulonser influncer = Infulonser();
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
                        onTap: () {}, child: const Text('Add Your Photo..')),
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
                            onChanged: (value) {
                              influncer.name = value;
                            },
                            type: TextInputType.name,
                            label: ' Name',
                            hint: "Haya Eid",
                            prefIcon: Icons.person,
                          ),
                          //UserName
                          TextFieldWidget(
                            onChanged: (value) {
                              influncer.userName = value;
                            },
                            type: TextInputType.name,
                            label: 'User Name',
                            hint: "Haya ",
                            prefIcon: Icons.person,
                          ),
                          //Description
                          TextFieldWidget(
                            onChanged: (value) {
                              influncer.description = value;
                            },
                            type: TextInputType.name,
                            label: 'Description',
                            hint: "I have so many bfghfccgbfg ",
                            prefIcon: Icons.description,
                          ),
                          //Phone
                          TextFieldWidget(
                            onChanged: (value) {
                              influncer.phone = value;
                            },
                            type: TextInputType.number,
                            label: 'PhoneNumber',
                            hint: "099717424666 ",
                            prefIcon: Icons.phone,
                          ),
                          //address
                          TextFieldWidget(
                            onChanged: (value) {
                              influncer.address = value;
                            },
                            type: TextInputType.name,
                            label: 'location',
                            hint: "aleppo ",
                            prefIcon: Icons.location_on,
                          ),
                          //PayBal
                          TextFieldWidget(
                            onChanged: (value) {
                              influncer.paypal = value;
                            },
                            type: TextInputType.number,
                            label: 'PayBal',
                            hint: "hsd235dfgdf ",
                            prefIcon: Icons.paypal,
                          ),

                          //Email
                          TextFieldWidget(
                            onChanged: (value) {
                              influncer.email = value;
                            },
                            type: TextInputType.emailAddress,
                            label: 'Email',
                            hint: "hy@gmail.com ",
                            prefIcon: Icons.email,
                          ),
                          ////////Passeword
                          Obx(() {
                            return TextField(
                               onChanged: (value){influncer.password=value;},
                              obscureText: !controller.isShownInfluencer.value,
                              keyboardType: TextInputType.visiblePassword,
                              cursorColor: AppColors.blue,
                              cursorHeight: 20,
                              autofocus: false,
                              decoration: InputDecoration(
                                  labelStyle:
                                      const TextStyle(color: Colors.black),
                                  hintStyle: TextStyle(color: Colors.grey[350]),
                                  labelText: 'Passeword',
                                  hintText: "***",
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.isShownInfluencer.value =
                                          !controller.isShownInfluencer.value;
                                    },
                                    icon: Icon(
                                      controller.isShownInfluencer.value
                                          ? Icons.remove_red_eye
                                          : Icons.disabled_visible,
                                      color: Colors.black,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.key,
                                    color: AppColors.orange,
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.orange, width: 1.5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.orange, width: 1.5),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.orange, width: 1.5),
                                  )),
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
                            onPressed: () {
                              controller.regierterInflu(influncer);
                              Get.rootDelegate.offNamed(Routes.HOME);
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
