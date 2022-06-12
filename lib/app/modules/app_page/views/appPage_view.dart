import 'package:flutter/material.dart';
import 'package:marful/app/core/values/app_colors.dart';
import 'package:marful/app/modules/app_page/views/page1App.dart';

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
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.search),
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
        body: const TabBarView(children: [
          PageOneApp(),
          Center(
            child: Text('2'),
          ),
          Center(
            child: Text('3'),
          ),
        ]),
      ),
    );
  }
}
