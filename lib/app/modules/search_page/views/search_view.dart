import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/values/app_colors.dart';
import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/content.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/modules/search_page/controllers/search_controller.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';
import 'package:marful/sheard/auth_service.dart';

import '../../../../sheard/util.dart';
import '../../../routes/app_pages.dart';
import '../../profile/views/profile_view.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> filter = [
      'company',
      'infulonser',
      'content',
      'brand',
      'product'
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
                        if (value.isEmpty) {
                          controller.company.clear();
                          controller.brand.clear();
                          controller.infulonser.clear();
                          controller.product.clear();
                          controller.content.clear();
                          controller.search.clear();
                        } else {
                          controller.inputvalue.value = value;
                        }
                      },
                      // onChanged: (Value) => controller.filter(Value),
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        prefixIcon: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.clear),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.getSearsh();
                          },
                          icon: const Icon(Icons.search),
                        ),
                        hintText: "Search",
                        hintStyle: const TextStyle(fontSize: 15),
                      )),
                ),
                const SizedBox(
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
                              if (controller.type.value == filter[index]) {
                                controller.type.value = '';
                              } else {
                                controller.type(filter[index]);
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    controller.type.value == filter[index]
                                        ? MaterialStateProperty.all(
                                            AppColors.orange)
                                        : MaterialStateProperty.all(
                                            Colors.grey[200]),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                            child: Text(filter[index]),
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
                            leading: SizedBox(
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
                                leading: SizedBox(
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
                                    leading: SizedBox(
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
                                        leading: SizedBox(
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
                                                onTap: () {
                                                  Get.rootDelegate
                                                      .toNamed(Routes.Content);
                                                },
                                                title: Text(controller
                                                    .content[index].name!),
                                              ))
                                  : controller.search.isNotEmpty
                                      ? ListView.builder(
                                          itemCount: controller.search.length,
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    child: Chip(
                                                        label: Text(
                                                          controller
                                                              .search[index]
                                                              .type!,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 17),
                                                        ),
                                                        backgroundColor:
                                                            AppColors.orange),
                                                  ),
                                                  Column(
                                                      children: controller
                                                          .search[index].search!
                                                          .map(
                                                    (e) {
                                                      if (controller
                                                              .search[index]
                                                              .type! ==
                                                          'company') {
                                                        return ListTile(
                                                            leading: SizedBox(
                                                                height: 40,
                                                                width: 40,
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/person.png',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )),
                                                            title: Text(
                                                              (e as Company)
                                                                  .name!,
                                                            ));
                                                      } else if (controller
                                                              .search[index]
                                                              .type! ==
                                                          'product') {
                                                        return ListTile(
                                                            leading: SizedBox(
                                                                height: 40,
                                                                width: 40,
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/person.png',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )),
                                                            title: Text(
                                                              (e as Product)
                                                                  .name!,
                                                            ));
                                                      } else if (controller
                                                              .search[index]
                                                              .type! ==
                                                          'infulonser') {
                                                        return ListTile(
                                                            leading: SizedBox(
                                                                height: 40,
                                                                width: 40,
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/person.png',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )),
                                                            title: Text(
                                                              (e as Infulonser)
                                                                  .name!,
                                                            ));
                                                      } else if (controller
                                                              .search[index]
                                                              .type! ==
                                                          'content') {
                                                        return ListTile(
                                                            leading: SizedBox(
                                                                height: 40,
                                                                width: 40,
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/person.png',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )),
                                                            title: Text(
                                                              (e as Content)
                                                                  .name!,
                                                            ));
                                                      } else if (controller
                                                              .search[index]
                                                              .type! ==
                                                          'brand') {
                                                        return ListTile(
                                                            leading: SizedBox(
                                                                height: 40,
                                                                width: 40,
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/person.png',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )),
                                                            title: Text(
                                                              (e as Brand)
                                                                  .name!,
                                                            ));
                                                      }
                                                      return Container();
                                                    },
                                                  ).toList())
                                                ],
                                              ))
                                      : Container(),
        ),
      ),
    );
  }
}
