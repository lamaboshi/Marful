import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/brand_page_controller.dart';

class BrandPageView extends GetView<BrandPageController> {
  const BrandPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> brand = [
      'Huda Beuty',
      'Narin Fashion',
      'Huda Beuty',
      'Narin Fashion',
      'Huda Beuty',
      'Narin Fashion',
      'Huda Beuty',
      'Narin Fashion',
    ];
    List<String> description = [
      'hghdghfhjjkhjghf bdfghjh',
      'hghdghfhjjkhjghf bdfghjh',
      'hghdghfhjjkhjghf bdfghjh',
      'hghdghfhjjkhjghf bdfghjh',
      'hghdghfhjjkhjghf bdfghjh',
      'hghdghfhjjkhjghf bdfghjh',
      'hghdghfhjjkhjghf bdfghjh',
      'hghdghfhjjkhjghf bdfghjh',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: const Text('Brand'),
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
                          controller.brand.value.name=txt;
                          
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
                            controller.addbrand(controller.brand.value);
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
            itemBuilder: ((context, index) => ListTile(
                  title: Text(controller.allBrands[index].name!),
                  subtitle: Text(controller.allBrands[index].description!),
                  leading: Image.asset(
                    'assets/images/3.jpg',
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                        //   Radius.circular(50),
                        ),
                  ),
                  trailing: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        controller.DelBrands(controller.allBrands[index].id!);
                      },
                      icon: const Icon(Icons.close)),
                )),
            separatorBuilder: ((context, index) => 
                const Divider(
                      endIndent: 8,
                      indent: 8,
                      thickness: 1,
                    )
                ),
            itemCount: brand.length),
      ),
    );
  }
}
