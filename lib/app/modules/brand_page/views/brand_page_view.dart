import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marful/app/modules/product_page/views/product_page_view.dart';

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
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/person.png'),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                            onTap: () {}, child: const Text('Add an image..')),

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
                          label: 'Description',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ExpansionTile(
                          title: const Text('Choose content'),
                          leading: const Icon(Icons.menu),
                          tilePadding: const EdgeInsets.all(0),
                          childrenPadding: const EdgeInsets.all(0),
                          children: [
                            for (var item in brand)
                              Padding(
                                padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item),
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
                  ),
                ));
          },
          label: Row(
            children: const [Icon(Icons.add), Text('Add')],
          )),
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(15),
          itemBuilder: ((context, index) => ListTile(
                onTap: () {
                  Get.to(ProductPageView());
                },
                title: Text(brand[index]),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(description[index]),
                ),
                leading: Image.asset(
                  'assets/images/3.jpg',
                ),
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
          itemCount: brand.length),
    );
  }
}
