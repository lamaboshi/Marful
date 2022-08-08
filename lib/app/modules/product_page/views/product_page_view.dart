import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../sheard/util.dart';
import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/product_page_controller.dart';

class ProductPageView extends GetView<ProductPageController> {
  const ProductPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // List<String> brand = [
    //   'Huda Beuty',
    //   'Narin Fashion',
    //   'Huda Beuty',
    //   'Narin Fashion',
    //   'Huda Beuty',
    //   'Narin Fashion',
    //   'Huda Beuty',
    //   'Narin Fashion',
    // ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
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
                            onTap: () async {
                          await controller.pickImage();
                            }, child: const Text('Add an image..')),

                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          onChanged: ((p0) {
                            controller.product.value.name=p0;
                          }),
                          type: TextInputType.name,
                          obscureText: false,
                          prefIcon: Icons.input,
                          label: 'Name',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                             onChanged: ((p0) {
                            controller.product.value.description=p0;
                          }),
                          type: TextInputType.name,
                          obscureText: false,
                          prefIcon: Icons.input,
                          label: 'Description',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // ExpansionTile(
                        //   title: const Text('Choose content'),
                        //   leading: const Icon(Icons.menu),
                        //   tilePadding: const EdgeInsets.all(0),
                        //   childrenPadding: const EdgeInsets.all(0),
                        //   children: [
                        //     for (var item in brand)
                        //       Padding(
                        //         padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
                        //         child: InkWell(
                        //           onTap: () {},
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               Text(item),
                        //               const SizedBox(
                        //                 height: 5,
                        //               ),
                        //               const Divider(),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //   ],
                        // ),

                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                          controller.addproduct(controller.product.value)    ;
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
                  ),
                ));
          },
          label: Row(
            children: const [Icon(Icons.add), Text('Add')],
          )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: controller.allproducts.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shadowColor: Colors.black45,
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     Align(
                      alignment: Alignment.topRight,
                      child: 
                  InkWell  (
                  onTap:(() => controller.Delproduct(controller.allproducts[index].id!)) ,
                        child: Icon(
                          Icons.close,
                          color: AppColors.blue,
                          size: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/3.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //product
                             Text(
                              controller.allproducts[index].name!,
                              style: TextStyle(
                                  height: 2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            //description
                             Text(
                              controller.allproducts[index].description!,
                              style: TextStyle(color: Colors.grey),
                            ),
                            const Spacer(),
                            Row(
                              children:  [
                                Icon(
                                  Icons.price_change,
                                  color: AppColors.blue,
                                  size: 20,
                                ),  Spacer(),
                                //price
                                Text(
                              controller.allproducts[index].price.toString()
                                ,  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: AppColors.blue),
                                ),  Spacer(),
                                // Expanded(
                                //   child: SizedBox(),
                                //   flex: 60,
                                // ),
                                // ButtonBar(
                                //   children: [
                                //     CircleAvatar(
                                //       radius: 18,
                                //       backgroundColor:AppColors.blue,
                                //       child: IconButton(
                                //         icon: Icon(
                                //           Icons.call,
                                //           color: Colors.white,
                                //           size: 18,
                                //         ),
                                //         onPressed: () {},
                                //       ),
                                //     ),
                                //     CircleAvatar(
                                //       radius: 18,
                                //       backgroundColor: AppColors.blue,
                                //       child: IconButton(
                                //         icon: Icon(
                                //           Icons.settings,
                                //           color: Colors.white,
                                //           size: 18,
                                //         ),
                                //         onPressed: () {},
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
