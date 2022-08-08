import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marful/app/core/values/app_colors.dart';

import '../../../core/component/textField.dart';
import '../../employeePer_page/views/employee_per_page_view.dart';
import '../controllers/permission_page_controller.dart';

class PermissionPageView extends GetView<PermissionPageController> {
  const PermissionPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> p = [
      'edit',
      'markting',
      'edit',
      'markting',
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Add new Permission',
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          type: TextInputType.name,
                          obscureText: false,
                          prefIcon: Icons.input,
                          label: "Name",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          type: TextInputType.name,
                          obscureText: false,
                          prefIcon: Icons.input,
                          label: "Employee name",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          type: TextInputType.name,
                          obscureText: false,
                          prefIcon: Icons.input,
                          label: "Passeword",
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
                      ],
                    ),
                  ));
            },
            label: Row(
              children: const [Icon(Icons.add), Text('Add')],
            )),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.to(const EmployeePerPageView());
              },
              child: SizedBox(
                height: 70,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Text(
                          p[index],
                          style: const TextStyle(fontSize: 17),
                        ),
                        const Spacer(),
                        IconButton(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.all(0),
                            onPressed: () {},
                            icon: const Icon(Icons.close)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: p.length,
        ));
  }
}
