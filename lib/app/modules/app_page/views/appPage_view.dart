import 'package:flutter/material.dart';
import 'package:marful/app/core/values/app_colors.dart';
import 'package:marful/app/modules/app_page/views/page1App.dart';
import 'package:marful/app/modules/content_page/views/content_view.dart';
import 'package:marful/app/modules/profile/views/profile_view.dart';
import 'package:marful/app/modules/settings/views/setting_view.dart';
import 'package:marful/app/modules/websit_company/views/websit_company_page.dart';

import 'searchDelegat.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          bottom: const TabBar(indicatorColor: Colors.white,
            tabs: [
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
                  showSearch(
                    context: context,
                    delegate: MySearchDelegat(),
                  );
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: TabBarView(children: [
         const PageOneApp(),
          ContentView(),
          SettingPage(),
        ]),
      ),
    );
  }
}
