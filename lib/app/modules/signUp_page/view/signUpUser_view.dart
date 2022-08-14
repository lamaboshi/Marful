import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/signUp_page/controllers/signUp_controller.dart';
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
                        onTap: () {}, child: const Text('Add Your Photo..')),
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
                              label: ' Name',
                              hint: "Haya Eid",
                              prefIcon: Icons.person,
                            ),
                            //UserName
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                controller.user.value.userName = value;
                              },
                              type: TextInputType.name,
                              label: 'User Name',
                              hint: "Haya ",
                              prefIcon: Icons.person,
                            ),
                            //Age
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                controller.user.value.age = int.parse(value);
                              },
                              type: TextInputType.number,
                              label: 'Age',
                              hint: "21 ",
                              prefIcon: Icons.description,
                            ),
                            //Phone
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                controller.user.value.phone = value;
                              },
                              type: TextInputType.number,
                              label: 'PhoneNumber',
                              hint: "099717424666 ",
                              prefIcon: Icons.phone,
                            ),
                            //address
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                //        controller.user.value.l= value;
                              },
                              type: TextInputType.number,
                              label: 'location',
                              hint: "aleppo ",
                              prefIcon: Icons.location_on,
                            ),
                            //PayBal
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                controller.user.value.paypal = value;
                              },
                              type: TextInputType.number,
                              label: 'PayBal',
                              hint: "hsd235dfgdf ",
                              prefIcon: Icons.paypal,
                            ),

                            //Email
                            TextFieldWidget(
                              obscureText: false,
                              onChanged: (value) {
                                controller.user.value.email = value;
                              },
                              type: TextInputType.emailAddress,
                              label: 'Email',
                              hint: "hy@gmail.com ",
                              prefIcon: Icons.email,
                            ),
                            ////////Passeword
                            Obx(() {
                              return TextFieldWidget(
                                onChanged: (value) {
                                  controller.user.value.password = value;
                                },
                                type: TextInputType.visiblePassword,
                                obscureText: !controller.isShownUser.value,
                                label: 'Passeword',
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
                                controller.signUpUser();
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
