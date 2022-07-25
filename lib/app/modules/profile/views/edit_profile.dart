import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../sheard/auth_service.dart';
import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/profile_controller.dart';

class EditProfilePage extends GetResponsiveView<ProfileController> {
  EditProfilePage({super.key});

  @override
  Widget builder() {
    switch (controller.typeAuth.value) {
      case Auth.infulonser:
        return viewPart(controller.infulencer.value.name!,
            controller.infulencer.value.description!);
      case Auth.comapny:
        return Column(
          children: [
            viewPart(controller.company.value.name!,
                controller.company.value.description!),
          ],
        );
      case Auth.user:
        return viewPart(controller.user.value.name!, '');
      default:
        return Text('no Value');
    }
  }

  Widget viewPart(String name, String descraption) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Obx(() => Container(
                        height: 200,
                        width: 200,
                        child: controller.imagefile.value.path.isNotEmpty
                            ? CircleAvatar(
                                backgroundImage:
                                    FileImage(controller.imagefile.value),
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/8.jpg"),
                              ),
                      )),
                  Positioned(
                      right: -10,
                      bottom: -10,
                      child: IconButton(
                          onPressed: () async {
                            await controller.pickImage();
                          },
                          icon: Icon(Icons.camera_enhance)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Update Name From' + name + 'to'),
                  TextFieldWidget(
                    type: TextInputType.multiline,
                    hint: 'Name',
                    obscureText: false,
                  ),
                  TextFieldWidget(
                    type: TextInputType.multiline,
                    hint: 'Username',
                    obscureText: false,
                  ),
                  TextFieldWidget(
                    type: TextInputType.multiline,
                    hint: 'Email',
                    obscureText: false,
                  ),
                  TextFieldWidget(
                    type: TextInputType.multiline,
                    hint: 'Age',
                    obscureText: false,
                  ),
                  TextFieldWidget(
                    type: TextInputType.multiline,
                    hint: 'PayPal',
                    obscureText: false,
                  ),
                  TextFieldWidget(
                    type: TextInputType.multiline,
                    hint: 'Phone',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.blue),
                        fixedSize: MaterialStateProperty.all(
                            const Size.fromWidth(150))),
                    onPressed: () async {},
                    child: const Text(
                      "Save ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
