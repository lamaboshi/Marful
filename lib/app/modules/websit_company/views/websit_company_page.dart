import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/websit_company/controllers/websit_company_controller.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';
import 'package:marful/app/routes/app_pages.dart';
import 'package:marful/sheard/util.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../core/values/app_colors.dart';
import '../../help_pagee/views/help_pagee_view.dart';

class WebsiteCompanyPage extends GetResponsiveView<WebsitcompanyController> {
  WebsiteCompanyPage({super.key});

  @override
  Widget builder() {
    controller.getAll();
    var width = screen.width;
    var height = screen.height;
    return Obx(() => controller.loading.value
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: AppColors.orange,
              onPressed: () {
                QPanel(
                        color: Colors.grey[100],
                        width: screen.isDesktop ? width / 3 : width / 1.4,
                        height: height,
                        child: SingleChildScrollView(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  'TheProducts'.tr,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black54),
                                )),
                              ),
                              Obx(() => ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.allProduct.length,
                                    itemBuilder: (context, index) {
                                      return photo(index);
                                    },
                                  )),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.blue),
                                    fixedSize: MaterialStateProperty.all(
                                        const Size.fromWidth(150))),
                                onPressed: () {
                                  controller.addBasket();
                                  controller.allProduct.clear();
                                  QOverlay.dismissLast();
                                },
                                child: Obx(
                                  () => Text("Total ${controller.totle.value}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        )),
                        alignment: Alignment.topRight)
                    .show();
              },
              icon: const Icon(Icons.shopping_basket),
              label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('YourBasket'.tr)),
            ),
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    Get.to(const HelpPageeView());
                  },
                  icon: const Icon(
                    Icons.help,
                    size: 30,
                    color: AppColors.orange,
                  ),
                ),
                actions: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.allCompany().company!.name!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: controller.allCompany().company!.image ==
                                    null
                                ? Image.network(
                                    'data:image/png;base64,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')
                                : Utility.imageFromBase64String(
                                    Utility.base64String(controller
                                        .allCompany()
                                        .company!
                                        .image!),
                                    null,
                                    null)),
                        IconButton(
                            onPressed: () {
                              Get.rootDelegate.offAndToNamed(Routes.HOME);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ]),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                      color: Colors.grey[100],
                      elevation: 10,
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: controller
                                      .allCompany.value.companyContents!
                                      .map(
                                        (e) => textbtn(e.content!.name!, width,
                                            height, e.id!),
                                      )
                                      .toList(),
                                ),
                              ]),
                          controller.idbrand() != 0
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        controller
                                            .allCompany()
                                            .brands!
                                            .where((element) =>
                                                element.id ==
                                                controller.idbrand())
                                            .first
                                            .name!,
                                        style: const TextStyle(
                                            fontSize: 40,
                                            color: AppColors.orange),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        controller
                                            .allCompany()
                                            .brands!
                                            .where((element) =>
                                                element.id ==
                                                controller.idbrand())
                                            .first
                                            .description!,
                                      ),
                                    )
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: height - 100,
                        width: width - 100,
                        child: Obx(
                          () => controller.loading.value
                              ? const Center(child: CircularProgressIndicator())
                              : Wrap(
                                  alignment: WrapAlignment.center,
                                  children: controller
                                      .allCompany.value.products!
                                      .where((element) =>
                                          element.brandId ==
                                          controller.idbrand.value)
                                      .map(
                                        (element) =>
                                            panel(element, width, height),
                                      )
                                      .toList()),
                        )),
                  ),
                ],
              ),
            ),
          ));
  }

  Widget photo(int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        title: Text(
          controller.allProduct[index].name!,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        subtitle: Obx(() => Text('(${controller.count[index]})')),
        trailing: Text(
          '${controller.allProduct[index].price}\$',
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.orange),
        ),
        leading: SizedBox(
          height: 40,
          width: 40,
          child: controller.allProduct[index].image == null
              ? Image.asset(
                  'assets/images/3.jpg',
                  fit: BoxFit.fill,
                )
              : Utility.imageFromBase64String(
                  Utility.base64String(controller.allProduct[index].image!),
                  null,
                  null),
        ),
        onTap: () {
          QPanel(
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            child: Center(
                          child: controller.allProduct[index].image == null
                              ? Image.asset(
                                  'assets/images/3.jpg',
                                  fit: BoxFit.fill,
                                )
                              : Utility.imageFromBase64String(
                                  Utility.base64String(
                                      controller.allProduct[index].image!),
                                  null,
                                  null),
                        )),
                      ),
                      Center(
                          child: Text(
                        controller.allProduct[index].name!,
                        style: const TextStyle(
                            fontSize: 30, color: Colors.black54),
                      )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: [
                            Text(
                              controller.allProduct[index].description!,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
                              child: Center(
                                child: Text(
                                  'ThepriceofOneis'.tr,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black87),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${controller.allProduct[index].price}\$',
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  'TotalCountYouNeed'.tr,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                              child: SizedBox(
                                  width: screen.width / 17,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 2),
                                    child: Obx(
                                      () => Text(
                                          controller.count[index].toString()),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 1, 2),
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        controller.count[index]++;
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: AppColors.blue,
                                        size: 20,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        if(controller.count[index]>0){
                                      controller.count[index]--;
                                        }else{
                                          controller.count[index]=0;
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: AppColors.blue,
                                        size: 20,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                                onPressed: () {
                                  controller.totle.value +=
                                      controller.allProduct[index].price! *
                                          controller.count[index];
                                          Get.back();
                                },
                                icon: const Icon(
                                  Icons.done,
                                  color: AppColors.orange,
                                  size: 35,
                                ))),
                      ),
                    ],
                  )),
                  alignment: Alignment.center)
              .show();
        },
      ),
    );
  }

  Widget panel(Product product, double width, double height) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: 270,
          height: 300,
          child: Stack(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: product.image == null
                      ? Image.asset(
                          'assets/images/3.jpg',
                          fit: BoxFit.fill,
                        )
                      : Utility.imageFromBase64String(
                          Utility.base64String(product.image!), null, null),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 40,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: 220,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //product
                            Text(
                              product.name!,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            //description
                            Text(
                              product.description!,
                              style: const TextStyle(color: Colors.grey),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('price'.tr),
                                    Text(
                                      '${product.price }\$'   ,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.orange),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (!controller.allProduct
                                          .contains(product)) {
                                        controller.allProduct.add(product);
                                        controller.count.add(1);

                                        controller.totle.value +=
                                            product.price!;
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.add_box_rounded,
                                      color: AppColors.orange,
                                    )),
                                // Row(
                                //   children: [
                                //     InkWell(
                                //       child: Icon(
                                //         Icons.add,
                                //         size: 20,
                                //         color: Colors.grey,
                                //       ),
                                //     ),
                                //     Text(' 3'),
                                //     InkWell(
                                //       child: Icon(
                                //         Icons.remove,
                                //         size: 20,
                                //         color: Colors.grey,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget textbtn(String name, double width, double height, int id) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 120,
          child: QExpander(
              expandChild: Column(
                children: controller
                    .allCompany()
                    .brands!
                    .where((element) => element.companyContentId == id)
                    .map((e) => InkWell(
                          onTap: () {
                            controller.idbrand.value = e.id!;
                            QOverlay.dismissLast();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.name!),
                          ),
                        ))
                    .toList(),
              ),
              child: Chip(label: Text(name))),
        ));
  }
}
