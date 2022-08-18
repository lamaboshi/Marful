import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/component/dialog.dart';
import 'package:marful/app/modules/haya/views/hayaProfil.dart';
import 'package:marful/app/modules/haya/views/hayamain.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/haya_controller.dart';
import 'hayaSplash.dart';

class HayaView extends GetView<HayaController> {
  const HayaView({Key? key}) : super(key: key);
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
            IconButton(
                onPressed: () {
                  Get.dialog(const DialogWidget(), barrierDismissible: false);
                  //   Get.rootDelegate.toNamed(Routes.CONVERSATION_PAGE);
                },
                icon: const Icon(Icons.message))
          ],
        ),
        // drawer: MenuPage(),
        body: TabBarView(children: [
          //HomeMainView(),
          const HayaMain(),
          //   PasswordPageView(),
          ProfilePage(),
          const HayaMenu(),
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
