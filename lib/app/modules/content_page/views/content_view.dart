import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/content_controller.dart';

class ContentView extends GetView<ContentController> {
  const ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> content = [
      'Comidy',
      'Fashion',
      'Drama',
      'Comidy',
      'Fashion',
      'Drama',
      'Comidy',
    ];
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
                          onPressed: () {},
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
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: FloatingActionButton.extended(
                      //   //  heroTag: 'uniqueTag',
                      //     backgroundColor: AppColors.orange,
                      //     label: Row(
                      //       children: const [Icon(Icons.close), Text('close')],
                      //     ),
                      //     //      const Icon(Icons.close),
                      //     onPressed: () {
                      //       Get.back();
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ));
          },
          label: Row(
            children: const [Icon(Icons.add), Text('Add')],
          )),
      body: ListView.separated( padding: const EdgeInsets.all(15),physics:const BouncingScrollPhysics(),
          itemBuilder: ((context, index) => ListTile(
                title: Text(content[index]),
                trailing: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: const Icon(Icons.close)),
              )),
          separatorBuilder: ((context, index) => const Divider(
                endIndent: 8,
                indent: 8,
                thickness: 1,
              )),
          itemCount: content.length),
    );
  }
}
