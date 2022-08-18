import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/values/app_colors.dart';
import 'package:marful/app/modules/profile/controllers/profile_controller.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../../sheard/util.dart';
import '../../../core/values/my_flutter_app_icons.dart';

class ProfilePage extends GetResponsiveView<ProfileController> {
  @override
  Widget builder() {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MainProfile(),
      ]),
    ));
  }
}

class MainProfile extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [viewPart('Noor Stars', null), InfulonserProfilePage()],
      ),
    );
  }

  Widget viewPart(String name, Uint8List? image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: image == null
                ? Image.asset(
                    'assets/images/8.jpg',
                    width: 200,
                    height: 200,
                  )
                : Utility.imageFromBase64String(
                    Utility.base64String(image), 200, 200),
          )),
          Center(
              child: Text(
            name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}

class InfulonserProfilePage extends GetResponsiveView<ProfileController> {
  @override
  Widget builder() {
    final random = Random();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.orange),
                    fixedSize:
                        MaterialStateProperty.all(const Size.fromWidth(150))),
                onPressed: () {},
                child: Text(
                  "CmpProfileFollow".tr,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    fixedSize:
                        MaterialStateProperty.all(const Size.fromWidth(150))),
                onPressed: () {},
                child: Text(
                  "CmpProfileMessage".tr,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        IntrinsicHeight(
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 70,
                  child: OutlinedButton(
                    onPressed: () async {
                      QPanel(
                              width: screen.width / 2,
                              alignment: Alignment.centerLeft,
                              child: Column(
                                  children: controller.follower
                                      .map((element) => ListTile(
                                            leading: const Icon(Icons.person,
                                                color: AppColors.orange),
                                            title: Text(element.name!),
                                            subtitle: Text(element.email!),
                                          ))
                                      .toList()))
                          .show();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(color: AppColors.orange),
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            '5',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.orange),
                          ),
                          Text(
                            'CmpProfileFollowors'.tr,
                            style: const TextStyle(
                                fontSize: 18, color: AppColors.orange),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                SizedBox(
                  width: 150,
                  height: 70,
                  child: OutlinedButton(
                    onPressed: () async {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(color: AppColors.blue),
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          const Text(
                            '2',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'CmpProfilePosts'.tr,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            'CmpProfileAboutMe'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Some DesCraption ',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            'CmpProfileContent'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
        ),
        SizedBox(
          width: screen.width / 5,
          child: Card(
            color: Color.fromARGB(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), random.nextInt(256)),
            elevation: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Wrap(
                children: const [
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Food',
                          style: TextStyle(fontSize: 17),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            'CmpProfilePosts'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                child: Card(
                  elevation: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  'assets/images/person.png',
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Huda ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Text(
                                      '16/8/2022',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.withOpacity(0.6)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: Text('Some Text'),
                            ),
                            Chip(
                              label: Icon(Icons.star, color: AppColors.orange),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/angryimg.png',
                              width: screen.width,
                              fit: BoxFit.fill,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                AppIcons.basket,
                                color: Colors.black,
                              ),
                            ),
                            const Text('3'),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(AppIcons.thumbs_down,
                                  color: Colors.black),
                            ),
                            const Text('2'),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                AppIcons.favorite,
                                color: Colors.red,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
