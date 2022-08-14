import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/component/deleteDialog.dart';
import 'package:marful/app/core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/content_controller.dart';

class ContentView extends GetView<ContentController> {
  const ContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          title: const Text('Content'),
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.orange,
            onPressed: () {
              Get.bottomSheet(
                  exitBottomSheetDuration: const Duration(milliseconds: 400),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Add new content',
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          onChanged: ((String txt) {
                            controller.addcontent.value.name = txt;
                          }),
                          type: TextInputType.name,
                          obscureText: false,
                          prefIcon: Icons.input,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.addcontentelement(
                                  controller.addcontent.value);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(AppColors.orange),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            child: const Center(child: Text('Add')),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ));
            },
            label: Row(
              children: const [Icon(Icons.add), Text('Add')],
            )),
        body: Obx(
          () => ListView.separated(
              padding: const EdgeInsets.all(15),
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) => ListTile(
                    title: Text(controller.contents[index].name!),
                    trailing: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Get.dialog(DeleteDialogWidget(delFunction: () {
                            controller
                                .delcontentelement(controller.contents[index]);
                          }));
                        },
                        icon: const Icon(Icons.delete)),
                  )),
              separatorBuilder: ((context, index) => const Divider(
                    endIndent: 8,
                    indent: 8,
                    thickness: 1,
                  )),
              itemCount: controller.contents.length),
        ));
  }
}
