import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/signIn_page/controllers/signIn_controller.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../../password_page/views/password_page.dart';

class SignInPage extends GetView<SignInController> {
  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<SignInController>();
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        //////////image
        Image(
          height: height * 1.03 / 3,
          fit: BoxFit.fill,
          image: const AssetImage(
            "assets/images/signin.png",
          ),
        ),
        ///////card with signUp information
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
                      //////////Sign In to your account
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign In to your account',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //////////Email
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: AppColors.blue,
                        cursorHeight: 20,
                        autofocus: false,
                        decoration: InputDecoration(
                            labelStyle: const TextStyle(color: Colors.black),
                            hintStyle: TextStyle(color: Colors.grey[350]),
                            labelText: 'Email',
                            hintText: "hy@gmail.com",
                            prefixIcon: Icon(
                              Icons.email,
                              color: AppColors.orange,
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.orange, width: 1.5),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.orange, width: 1.5),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.orange, width: 1.5),
                            )),
                      ),
                      //////////passeword
                      Obx(() {
                        return TextField(
                          obscureText: controller.isShown.value,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: AppColors.blue,
                          cursorHeight: 20,
                          autofocus: false,
                          decoration: InputDecoration(
                              labelStyle: const TextStyle(color: Colors.black),
                              hintStyle: TextStyle(color: Colors.grey[350]),
                              labelText: 'Passeword',
                              hintText: "***",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isShown.value =
                                      !controller.isShown.value;
                                },
                                icon: Icon(
                                  controller.isShown.value
                                      ? Icons.remove_red_eye
                                      : Icons.shower,
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
                        height: 20,
                      ),
                      //////////Forgot Your Passeword?
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () async {
                            await Get.to(PasswordPage());
                          },
                          child: const Text(
                            'Forgot Your Passeword?',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      //////////btn Sign In
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.blue),
                            fixedSize: MaterialStateProperty.all(
                                const Size.fromWidth(150))),
                        onPressed: () {
                          Get.rootDelegate.offNamed(Routes.HOME);
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
