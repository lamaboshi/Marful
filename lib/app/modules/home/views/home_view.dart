import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/menu/views/menu_view.dart';
import 'package:marful/sheard/auth_service.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../../homeMain_page/views/homeMain_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.auth.getTypeEnum() == Auth.user
          ? 2
          : (controller.auth.getTypeEnum() == Auth.comapny &&
                      controller.auth.companyType() == 'chat employee') ||
                  (controller.auth.getTypeEnum() == Auth.comapny &&
                      controller.auth.companyType() == 'Publishing Officer')
              ? 2
              : 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          bottom: controller.auth.getTypeEnum() == Auth.user
              ? const TabBar(indicatorColor: Colors.white, tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    icon: Icon(Icons.menu),
                  )
                ])
              : (controller.auth.getTypeEnum() == Auth.comapny &&
                          controller.auth.companyType() == 'chat employee') ||
                      (controller.auth.getTypeEnum() == Auth.comapny &&
                          controller.auth.companyType() == 'Publishing Officer')
                  ? const TabBar(indicatorColor: Colors.white, tabs: [
                      Tab(
                        icon: Icon(Icons.home),
                      ),
                      Tab(
                        icon: Icon(Icons.person),
                      ),
                    ])
                  : const TabBar(indicatorColor: Colors.white, tabs: [
                      Tab(
                        icon: Icon(Icons.home),
                      ),
                      Tab(
                        icon: Icon(Icons.person),
                      ),
                      Tab(
                        icon: Icon(Icons.menu),
                      )
                    ]),
          title: const Text('MarFlu'),
          actions: [
            IconButton(
                onPressed: () {
                  Get.rootDelegate.toNamed(Routes.Search);
                },
                icon: const Icon(Icons.search)),
            controller.auth.getTypeEnum() == Auth.user ||
                    (controller.auth.getTypeEnum() == Auth.comapny &&
                        controller.auth.companyType() == 'Editing Officer') ||
                    (controller.auth.getTypeEnum() == Auth.comapny &&
                        controller.auth.companyType() == 'Publishing Officer')
                ? IconButton(
                    onPressed: () {
                      Get.dialog(AlertDialog(
                        content: Row(
                          children: [
                            const Icon(
                              Icons.info_outlined,
                              color: AppColors.orange,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('AreyousurewanttoLogOut'.tr),
                          ],
                        ),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        actionsPadding:
                            const EdgeInsets.fromLTRB(15, 10, 15, 20),
                        actions: [
                          Row(children: [
                            ElevatedButton(
                              onPressed: () {
                                controller.auth.stroge.deleteAllKeys();
                                Get.rootDelegate.toNamed(Routes.SignIn);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(AppColors.blue),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              child: Text('Yes'.tr),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(AppColors.blue),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              child: Text('Cancel'.tr),
                            ),
                          ]),
                        ],
                      ));
                    },
                    icon: const Icon(Icons.logout))
                : IconButton(
                    onPressed: () {
                      Get.rootDelegate.toNamed(Routes.CONVERSATION_PAGE);
                    },
                    icon: const Icon(Icons.message))
          ],
        ),
        body: controller.auth.getTypeEnum() == Auth.user
            ? TabBarView(children: [
                HomeMainView(),
                const HomeMenuView(),
              ])
            : (controller.auth.getTypeEnum() == Auth.comapny &&
                        controller.auth.companyType() == 'chat employee') ||
                    (controller.auth.getTypeEnum() == Auth.comapny &&
                        controller.auth.companyType() == 'Publishing Officer')
                ? TabBarView(children: [
                    HomeMainView(),
                    ProfilePage(false, null, null),
                  ])
                : TabBarView(children: [
                    HomeMainView(),
                    ProfilePage(false, null, null),
                    const HomeMenuView(),
                  ]),
      ),
    );
  }
}

class SS extends StatelessWidget {
  const SS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconButton(
          onPressed: () {
            Get.rootDelegate.toNamed(Routes.Report);
          },
          icon: const Icon(Icons.search)),
    );
  }
}
