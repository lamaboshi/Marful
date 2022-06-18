import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/signUp_page/controllers/signUp_controller.dart';

import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';

class SignUpCompanyPage extends GetView<SignUpController> {
  const SignUpCompanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    //  final controller = Get.find<SignInController>();
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
                            Type: TextInputType.name,
                            Label: 'Company Name',
                            Hint: "narin",
                            PrefIcon: Icons.person,
                          ),

                          //Phone
                          TextFieldWidget(
                            Type: TextInputType.number,
                            Label: 'PhoneNumber',
                            Hint: "099717424666",
                            PrefIcon: Icons.phone,
                          ),

                          //TelePhone
                          TextFieldWidget(
                            Type: TextInputType.number,
                            Label: 'TelePhone',
                            Hint: "5225356",
                            PrefIcon: Icons.phone,
                          ),

                          ///Description

                          TextFieldWidget(
                            Type: TextInputType.none,
                            Label: 'Description',
                            Hint: "i am gdfsdfj,gh",
                            PrefIcon: Icons.description,
                          ),

                          //location
                          TextFieldWidget(
                            Type: TextInputType.number,
                            Label: 'location',
                            Hint: "aleppo",
                            PrefIcon: Icons.location_on,
                          ),

                          //Email
                          TextFieldWidget(
                            Type: TextInputType.emailAddress,
                            Label: 'Email',
                            Hint: "hy@gmail.com",
                            PrefIcon: Icons.email,
                          ),

                          ////////Passeword
                          Obx(() {
                            return TextField(
                              obscureText: !controller.isShownCompany.value,
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
                                      controller.isShownCompany.value =
                                          !controller.isShownCompany.value;
                                    },
                                    icon: Icon(
                                      controller.isShownCompany.value
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
