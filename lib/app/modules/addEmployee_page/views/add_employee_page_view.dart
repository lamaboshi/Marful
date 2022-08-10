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
        floatingActionButton: FloatingActionButton.extended(
            heroTag: 'uniqueTag',
            backgroundColor: AppColors.orange,
            onPressed: () {
              Get.dialog(
                  barrierDismissible: false,
                  AlertDialog(
                    scrollable: true,
                    actionsPadding: const EdgeInsets.all(13),
                    title: Text('Add permission',),
                    content: Column(
                      children: [
                        for (var item in p)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
                            child: InkWell(
                              onTap: () {
                                //هي الصلاحية يلي اختارا باتضاق برا مع صلاحياتو
                                Get.back();},
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(color: AppColors.orange,),
                                ],
                              ),
                            ),
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
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(
                    //       3, 10, 0, 0),
                    //   child: InkWell(
                    //     onTap: () {},
                    //     child: Column(
                    //       crossAxisAlignment:
                    //           CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Text(item),
                    //             const Spacer(),
                    //             IconButton(
                    //               onPressed: () {},
                    //               icon:
                    //                   const Icon(Icons.close),
                    //               padding:
                    //                   const EdgeInsets.all(0),
                    //               alignment:
                    //                   Alignment.topRight,
                    //             ),
                    //           ],
                    //         ),
                    //         const SizedBox(
                    //           height: 5,
                    //         ),
                    //         const Divider(),
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

                  title: Text(p[index]),
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
            itemCount: p.length));
  }
}
