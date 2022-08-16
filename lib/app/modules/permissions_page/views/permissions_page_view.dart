import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/component/deleteDialog.dart';
import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/permissions_page_controller.dart';

class PermissionsPageView extends GetView<PermissionsPageController> {
  const PermissionsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> employee = [
      'ahmad',
      'Haya',
      'Asia',
      'Hadeel',
      'Lama',
      'yousfi'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
        backgroundColor: AppColors.orange,
      ),
      floatingActionButton: FloatingActionButton.extended(
          heroTag: 'uniqueTag',
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Add new employee',
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          type: TextInputType.name,
                          obscureText: false,
                          prefIcon: Icons.input,
                          label: 'Name',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          type: TextInputType.name,
                          obscureText: false,
                          prefIcon: Icons.input,
                          label: 'Passeword',
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
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ));
          },
          label: Row(
            children: const [
              Icon(Icons.add),
              SizedBox(
                width: 5,
              ),
              Text('Add')
            ],
          )),
      body: ListView.separated(
          padding: const EdgeInsets.all(15),
          itemBuilder: ((context, index) => Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                child: Row(
                  children: [
                    Text(employee[index]),
                    const Spacer(),
                    IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Get.bottomSheet(
                              exitBottomSheetDuration:
                                  const Duration(milliseconds: 400),
                              enterBottomSheetDuration:
                                  const Duration(milliseconds: 500),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                ),
                              ),
                              backgroundColor: Colors.white,
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'Edit',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFieldWidget(
                                        type: TextInputType.name,
                                        obscureText: false,
                                        prefIcon: Icons.input,
                                        label: 'Name',
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFieldWidget(
                                        type: TextInputType.name,
                                        obscureText: false,
                                        prefIcon: Icons.input,
                                        label: 'Passeword',
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
                                                  MaterialStateProperty.all(
                                                      AppColors.orange),
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white)),
                                          child:
                                              const Center(child: Text('Edit')),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                        },
                        icon: const Icon(
                          Icons.edit,
                        )),
                    IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Get.dialog(DeleteDialogWidget(
                            delFunction: () {},
                          ));
                        },
                        icon: const Icon(
                          Icons.delete,
                        ))
                  ],
                ),
              ))),
          separatorBuilder: ((context, index) => const SizedBox(
                height: 5,
              )),
          itemCount: employee.length),
    );
  }
}
