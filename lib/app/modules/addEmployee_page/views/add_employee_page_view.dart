import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marful/app/core/component/textField.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/add_employee_page_controller.dart';

class AddEmployeePageView extends GetView<AddEmployeePageController> {
  const AddEmployeePageView({Key? key}) : super(key: key);
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
          title: const Text('Haya permissions'),
          backgroundColor: AppColors.orange,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Employee name: Haya',
                      style: TextStyle(fontSize: 19),
                    ),
                    const SizedBox(
                      height: 20,
                    ),   ExpansionTile(
                      title: const Text('Employee permissions'),
                      leading: const Icon(Icons.menu),
                      tilePadding: const EdgeInsets.all(0),
                      childrenPadding: const EdgeInsets.all(0),
                      children: [
                        for (var item in p)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(item),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.close),
                                        padding: const EdgeInsets.all(0),
                                        alignment: Alignment.topRight,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                 
                    TextFieldWidget(
                      obscureText: false,
                      prefIcon: Icons.border_color,
                      type: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.orange),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: const Center(child: Text('Add')),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
