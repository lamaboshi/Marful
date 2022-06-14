import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/signUp_page/controllers/signUp_controller.dart';
import 'package:marful/app/routes/app_pages.dart';

import '../../../core/values/app_colors.dart';

class SignUpInfluencer extends GetView<SignUpController> {
  const SignUpInfluencer({Key? key}) : super(key: key);

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
            shape: RoundedRectangleBorder(    borderRadius: BorderRadius.only(
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
                          ///Name
                           TextField(
                            keyboardType: TextInputType.name,
                            cursorColor: AppColors.blue,
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                                labelStyle:const TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.grey[350]),
                                labelText: 'Name',
                                hintText: "Haya Eid",
                                prefixIcon:const Icon(
                                  Icons.person,
                                  color: AppColors.orange,
                                ),
                                border:const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.orange, width: 1.5),
                                ),
                                contentPadding:const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                enabledBorder:const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.orange, width: 1.5),
                                ),
                                focusedBorder:const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.orange, width: 1.5),
                                )),
                          ),
                          ////////UserName
                           TextField(
                            keyboardType: TextInputType.name,
                            cursorColor: AppColors.blue,
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                                labelStyle:const TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.grey[350]),
                                labelText: 'User Name',
                                hintText: "haya",
                                prefixIcon: Icon(
                                  Icons.person,
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
                      ///Description
                               TextField(
                            cursorColor: AppColors.blue,
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                                labelStyle:const TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.grey[350]),
                                labelText: 'Description',
                                hintText: "I have so many bfghfccgbfg",
                                prefixIcon: Icon(
                                  Icons.description,
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
                          /////Phone
                           TextField(
                            keyboardType: TextInputType.number,
                            // TextInputType.visiblePassword,
                            cursorColor: AppColors.blue,
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                                labelStyle:const TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.grey[350]),
                                labelText: 'PhoneNumber',
                                hintText: "099717424666",
                                prefixIcon: Icon(
                                  Icons.phone,
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
     
                          ///////address
                           TextField(
                            keyboardType: TextInputType.number,
                            // TextInputType.visiblePassword,
                            cursorColor: AppColors.blue,
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                                labelStyle:const TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.grey[350]),
                                labelText: 'location',
                                hintText: "aleppo",
                                prefixIcon: const Icon(
                                  Icons.location_on,
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
                       ///PayBal
                            TextField(
                            keyboardType: TextInputType.number,
                            // TextInputType.visiblePassword,
                            cursorColor: AppColors.blue,
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                                labelStyle:const TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.grey[350]),
                                labelText: 'PayBal',
                                hintText: "hsd235dfgdf",
                                prefixIcon: Icon(
                                  Icons.paypal,
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
  
                          //////////Email
                           TextField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: AppColors.blue,
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                                labelStyle:const TextStyle(color: Colors.black),
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
                          ////////Passeword
                          Obx(() {
                            return TextField(
                              obscureText:! controller.isShownInfluencer.value,
                              keyboardType: TextInputType.visiblePassword,
                              cursorColor: AppColors.blue,
                              cursorHeight: 20,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelStyle:const TextStyle(color: Colors.black),
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