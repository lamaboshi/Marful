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
      length: controller.auth.getTypeEnum() == Auth.user ? 2 : 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          bottom: controller.auth.getTypeEnum() == Auth.user
              ? TabBar(indicatorColor: Colors.white, tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    icon: Icon(Icons.menu),
                  )
                ])
              : TabBar(indicatorColor: Colors.white, tabs: [
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
            controller.auth.getTypeEnum() == Auth.user
                ? SizedBox.shrink()
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
            : TabBarView(children: [
                HomeMainView(),
                ProfilePage(false),
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
