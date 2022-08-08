import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/product_page_controller.dart';

class ProductPageView extends GetView<ProductPageController> {
  const ProductPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                            },
                            child: const Text('Add an image..')),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          onChanged: ((p0) {
                            controller.product.value.name = p0;
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
                            controller.product.value.description = p0;
                          }),
                          type: TextInputType.name,
                          obscureText: false,
                          prefIcon: Icons.input,
                          label: 'Description',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          type: TextInputType.number,
                          obscureText: false,
                          prefIcon: Icons.input,
                          label: 'Price',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          type: TextInputType.name,
                          obscureText: false,
                          prefIcon: Icons.input,
                          label: 'Code',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.addproduct(controller.product.value);
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
              childAspectRatio: 0.7,
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: controller.allproducts.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shadowColor: Colors.black45,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            'assets/images/1.jpg',
                            height: 140,
                            fit: BoxFit.fill,
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //product
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.allproducts[index].name!,
                                    style: TextStyle(
                                        height: 1,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  //description
                                  Text(
                                    controller.allproducts[index].description!,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const Spacer(),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Icon(
                                        Icons.price_change,
                                        color: AppColors.blue,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      //price
                                      Text(
                                        'k1',
                                        //    controller.allproducts[index].price.toString(),

                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: AppColors.blue),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 1, 0, 5),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: (() => controller.Delproduct(
                                controller.allproducts[index].id!)),
                            child: const Icon(
                              Icons.close,
                              color: Colors.grey,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
