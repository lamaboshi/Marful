import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/password_page/controllers/password_controller.dart';
import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';

class PasswordPageView extends GetView<PasswordController> {
  const PasswordPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Get.rootDelegate.offNamed(Routes.SignIn);
                      },
                      icon: const Icon(Icons.arrow_back,
                          size: 30, color: AppColors.blue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Text(
                      'ForgotYourPasswod'.tr,
                      style: const TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Card(
                elevation: 0,
                child: SizedBox(
                    width: width / 2,
                    height: height / 2.3,
                    child: Image.asset('assets/images/Social ideas.gif'))),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Entertheregisterdemailaddress'.tr,
                style: const TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'wewillemailyoualinktoreset'.tr,
                style: const TextStyle(fontSize: 18, color: Colors.black45),
              ),
            ),
<<<<<<< HEAD
            const Text(
              ' your password',
              style: TextStyle(fontSize: 18, color: Colors.black45),
=======
            Text(
              'yourpassword'.tr,
              style: const TextStyle(fontSize: 18, color: Colors.black45),
>>>>>>> cc0742d3233425887591ce1d8b7e7d3941c6a3d5
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 16, 25, 15),
              child: TextField(
                onChanged: (newText) {
                  controller.email.value = newText;
                },
                keyboardType: TextInputType.emailAddress,
                cursorColor: AppColors.blue,
                cursorHeight: 20,
                autofocus: false,
<<<<<<< HEAD
                decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey),
                    labelText: 'Email',
=======
                decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.grey),
                    labelText: 'Email'.tr,
>>>>>>> cc0742d3233425887591ce1d8b7e7d3941c6a3d5
                    hintText: "hy@gmail.com",
                    prefixIcon: const Icon(
                      Icons.email,
                      color: AppColors.orange,
                    ),
                    border: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.orange, width: 1.5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.orange, width: 1.5),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.orange, width: 1.5),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.blue),
                  fixedSize:
                      MaterialStateProperty.all(const Size.fromWidth(150))),
              onPressed: () {
                controller.getEmail();
              },
              child: Text(
                "Send".tr,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
