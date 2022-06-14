import 'package:flutter/material.dart';
import 'package:marful/app/core/values/app_colors.dart';
import 'package:marful/app/modules/report_page/views/buildreport.dart';

class ReportView extends StatelessWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.orange,
            title: const Text('Repot'),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Influencer',
                ),
                Tab(
                  text: 'Company',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BuildReport(),
              BuildReport(),
            ],
          )),
    );
  }
}
