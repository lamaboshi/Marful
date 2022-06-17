import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../../content_page/views/content_view.dart';
import '../../homeMain_page/views/homeMain_view.dart';
import '../../menu/views/menu_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          bottom: const TabBar(indicatorColor: Colors.white, tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.settings),
            )
          ]),
          title: const Text('MarFlu'),
          actions: [
            IconButton(
                onPressed: () {
                  Get.rootDelegate.toNamed(Routes.Search);
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Get.rootDelegate.toNamed(Routes.CONVERSATION_PAGE);
                },
                icon: const Icon(Icons.message))
          ],
        ),
        drawer: MenuPage(),
        body: TabBarView(children: [
          const HomeMainView(),
          const ContentView(),
          SS(),
        ]),
      ),
    );
  }
}

class SS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconButton(
          onPressed: () {
            Get.rootDelegate.toNamed(Routes.Report);
          },
          icon: Icon(Icons.search)),
    );
  }
}
