import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marful/app/core/values/app_colors.dart';

import '../../../core/component/textField.dart';
import '../controllers/employee_per_page_controller.dart';

class EmployeePerPageView extends GetView<EmployeePerPageController> {
  const EmployeePerPageView({Key? key}) : super(key: key);
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
        title: const Text('Employee'),
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
          padding: const EdgeInsets.all(15),
          itemBuilder: ((context, index) => ListTile(
                onTap: () {
             
                  // Get.dialog(
                  //     barrierDismissible: false,
                  //     AlertDialog( scrollable : true,
                  //       actionsPadding: const EdgeInsets.all(13),
                  //       actions: [
                  //         SingleChildScrollView(
                  //           child: Column(
                  //             children: [
                  //               Text(employee[index]),
                  //               ExpansionTile(
                  //                 title: const Text('Employee permissions'),
                  //                 leading: const Icon(Icons.menu),
                  //                 tilePadding: const EdgeInsets.all(0),
                  //                 childrenPadding: const EdgeInsets.all(0),
                  //                 children: [
                  //                   for (var item in employee)
                  //                     Padding(
                  //                       padding: const EdgeInsets.fromLTRB(
                  //                           3, 10, 0, 0),
                  //                       child: InkWell(
                  //                         onTap: () {},
                  //                         child: Column(
                  //                           crossAxisAlignment:
                  //                               CrossAxisAlignment.start,
                  //                           children: [
                  //                             Row(
                  //                               children: [
                  //                                 Text(item),
                  //                                 const Spacer(),
                  //                                 IconButton(
                  //                                   onPressed: () {},
                  //                                   icon:
                  //                                       const Icon(Icons.close),
                  //                                   padding:
                  //                                       const EdgeInsets.all(0),
                  //                                   alignment:
                  //                                       Alignment.topRight,
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             const SizedBox(
                  //                               height: 5,
                  //                             ),
                  //                             const Divider(),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ),
                  //                 ],
                  //               ),
                  //               TextFieldWidget(
                  //                 obscureText: false,
                  //                 prefIcon: Icons.border_color,
                  //                 type: TextInputType.name,
                  //               ),
                  //               ElevatedButton(
                  //                 onPressed: () {
                  //                   Get.back();
                  //                 },
                  //                 style: ButtonStyle(
                  //                     backgroundColor:
                  //                         MaterialStateProperty.all(
                  //                             AppColors.orange),
                  //                     foregroundColor:
                  //                         MaterialStateProperty.all(
                  //                             Colors.white)),
                  //                 child: const Center(child: Text('Add')),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ));
             
                },
               
                title: Text(employee[index]),
                //   subtitle: Text(description[index]),
                // leading: Image.asset(
                //   'assets/images/3.jpg',
                // ),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
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
          itemCount: employee.length),
    );
  }
}
