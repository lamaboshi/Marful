import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/values/app_colors.dart';
import 'package:marful/app/modules/search_page/controllers/search_controller.dart';
import 'package:marful/sheard/auth_service.dart';

import '../../../../sheard/util.dart';
import '../../../routes/app_pages.dart';
import '../../profile/views/profile_view.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> filter = [
<<<<<<< HEAD
      'Brand'.tr,
      'Influencer'.tr,
      'Company'.tr,
      'Content'.tr,
      'Product'.tr
=======
      'company',
      'infulonser',
      'content',
      'brand',
      'product'
>>>>>>> cff778314f108fe79ca5b53b9aada6b8488e6cd8
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size(3, 80),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]),
                  child: TextField(
                      onChanged: (value) {
                        controller.inputvalue.value = value;
                      },
                      // onChanged: (Value) => controller.filter(Value),
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        prefixIcon: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.clear),
                        ),
<<<<<<< HEAD
                        hintText: "SearchPage".tr,
=======
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.getSearsh();
                          },
                          icon: Icon(Icons.search),
                        ),
                        hintText: "Search",
>>>>>>> cff778314f108fe79ca5b53b9aada6b8488e6cd8
                        hintStyle: TextStyle(fontSize: 15),
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 30,
                  color: Colors.white,
                  child: ListView.separated(
                    itemCount: filter.length,
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.fromLTRB(0, 0, 0, 0), //15, 20, 15, 0
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 12,
                      );
                    },

                    itemBuilder: (BuildContext context, int index) {
                      return Obx(() => ElevatedButton(
                            onPressed: () {
                              controller.type(filter[index]);
                            },
                            child: Text(filter[index]),
                            style: ButtonStyle(
                                backgroundColor:
                                    controller.type.value == filter[index]
                                        ? MaterialStateProperty.all(
                                            AppColors.orange)
                                        : MaterialStateProperty.all(
                                            Colors.grey[200]),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                          ));
                    },
                  ),
                ),
                // SizedBox(height: 3,),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => controller.loading.value
              ? const Center(child: CircularProgressIndicator())
              : controller.company.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.company.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
                            onTap: () {
                              Get.to(ProfilePage(true, Auth.comapny,
                                  controller.company[index].id!));
                            },
                            leading: Container(
                              height: 40,
                              width: 40,
                              child: controller.company[index].image == null
                                  ? Image.asset(
                                      'assets/images/person.png',
                                      fit: BoxFit.fill,
                                    )
                                  : Utility.imageFromBase64String(
                                      Utility.base64String(
                                          controller.company[index].image!),
                                      null,
                                      null),
                            ),
                            title: Text(controller.company[index].name!),
                          ))
                  : controller.infulonser.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.infulonser.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ListTile(
                                onTap: () {
                                  Get.to(ProfilePage(true, Auth.infulonser,
                                      controller.infulonser[index].id!));
                                },
                                leading: Container(
                                  height: 40,
                                  width: 40,
                                  child:
                                      controller.infulonser[index].image == null
                                          ? Image.asset(
                                              'assets/images/person.png',
                                              fit: BoxFit.fill,
                                            )
                                          : Utility.imageFromBase64String(
                                              Utility.base64String(controller
                                                  .infulonser[index].image!),
                                              null,
                                              null),
                                ),
                                title: Text(controller.infulonser[index].name!),
                              ))
                      : controller.product.isNotEmpty
                          ? ListView.builder(
                              itemCount: controller.product.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  ListTile(
                                    leading: Container(
                                      height: 40,
                                      width: 40,
                                      child: controller.product[index].image ==
                                              null
                                          ? Image.asset(
                                              'assets/images/person.png',
                                              fit: BoxFit.fill,
                                            )
                                          : Utility.imageFromBase64String(
                                              Utility.base64String(controller
                                                  .product[index].image!),
                                              null,
                                              null),
                                    ),
                                    title:
                                        Text(controller.product[index].name!),
                                  ))
                          : controller.brand.isNotEmpty
                              ? ListView.builder(
                                  itemCount: controller.brand.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      ListTile(
                                        onTap: () {
                                          Get.rootDelegate.toNamed(
                                              Routes.WebsiteCompany,
                                              arguments: 1);
                                        },
                                        leading: Container(
                                          height: 40,
                                          width: 40,
                                          child: controller
                                                      .brand[index].image ==
                                                  null
                                              ? Image.asset(
                                                  'assets/images/person.png',
                                                  fit: BoxFit.fill,
                                                )
                                              : Utility.imageFromBase64String(
                                                  Utility.base64String(
                                                      controller
                                                          .brand[index].image!),
                                                  null,
                                                  null),
                                        ),
                                        title:
                                            Text(controller.brand[index].name!),
                                      ))
                              : controller.content.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: controller.content.length,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              ListTile(
                                                title: Text(controller
                                                    .content[index].name!),
                                              ))
                                  : Container(),
        ),
      ),
    );
  }
}
