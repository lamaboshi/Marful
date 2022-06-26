import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/signUp_page/controllers/signUp_controller.dart';
import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../data/model/company.dart';

class SignUpCompanyPage extends GetView<SignUpController> {
  const SignUpCompanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    Company company = Company(
      
        name: '',
        email: '',
        passeword: '',
        phone: '',
        telePhone: '',
        address: '',
        description: '');
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
                              company.name = value;
                            },
                            type: TextInputType.name,
                            label: 'Company Name',
                            hint: "narin",
                            prefIcon: Icons.person,
                          ),

                          //Phone
                          TextFieldWidget(
                            onChanged: (value) {
                              company.phone = value;
                            },
                            type: TextInputType.number,
                            label: 'PhoneNumber',
                            hint: "099717424666",
                            prefIcon: Icons.phone,
                          ),

                          //TelePhone
                          TextFieldWidget(
                            onChanged: (value) {
                              company.telePhone = value;
                            },
                            type: TextInputType.number,
                            label: 'TelePhone',
                            hint: "5225356",
                            prefIcon: Icons.phone,
                          ),

                          ///Description

                          TextFieldWidget(
                            onChanged: (value) {
                              company.description = value;
                            },
                            type: TextInputType.name,
                            label: 'Description',
                            hint: "i am gdfsdfj,gh",
                            prefIcon: Icons.description,
                          ),

                          //Address
                          TextFieldWidget(
                            onChanged: (value) {
                              company.address = value;
                            },
                            type: TextInputType.number,
                            label: 'location',
                            hint: "aleppo",
                            prefIcon: Icons.location_on,
                          ),

                          //Email
                          TextFieldWidget(
                            onChanged: (value) {
                              company.email = value;
                            },
                            type: TextInputType.emailAddress,
                            label: 'Email',
                            hint: "hy@gmail.com",
                            prefIcon: Icons.email,
                          ),

                          ////////Passeword
                          Obx(() {
                            return TextField(
                              onChanged: (value){company.passeword=value;},
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
                            onPressed: ()async {
                             bool h=await controller.regierterComp(company);
                             if(h){    Get.rootDelegate.offNamed(Routes.HOME);}
                             else print('noooooo');
                          
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
