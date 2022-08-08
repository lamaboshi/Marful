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
                  child: Column(
                    children: [
                      //Sign In to your account
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

                      //Email
                      TextFieldWidget(
                        obscureText: false,
                        type: TextInputType.emailAddress,
                        label: 'Email',
                        hint: "hy@gmail.com",
                        prefIcon: Icons.email,
                        onChanged: (value) {
                          controller.email.value = value;
                        },
                      ),
                      //////////passeword
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
                            style: TextStyle(fontSize: 15, color: Colors.grey),
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
                          controller.logIn();
                        },
                        child: const Text(
                          "Sign In",
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
                        child: const Text('Create Your Account?'),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
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
