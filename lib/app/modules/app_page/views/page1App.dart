import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class PageOneApp extends StatelessWidget {
  const PageOneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: height * 1 / 4.89,
              child: ListView.separated(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(30),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 12,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return buildCircul(index);
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 30,
                (BuildContext context, int index) {
              return buildpost(index);
            }),
          ),
        ],
      ),
    );
  }

  Widget buildCircul(int index) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.blue,
            radius: 42,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/person.png',
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // const SizedBox(
          //   height: 7,
          // ),
          Text('comidy'),
        ],
      );
  Widget buildpost(int index) => SizedBox(
      //  height: 180,
        child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 10,
                  child: Image.asset(
                    'assets/images/person.png',
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text('Haya Eid'),
                subtitle: Text('Hi EveryOne How Are You Today.............'),
              ),
              ButtonBar(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.living_outlined)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.living_outlined)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.living_outlined)),
                ],
              )
            ],
          ),
        ),
      );
}
