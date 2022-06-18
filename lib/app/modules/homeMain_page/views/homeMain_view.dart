import 'package:flutter/material.dart';
import 'package:marful/app/core/values/my_flutter_app_icons.dart';
import '../../../core/values/app_colors.dart';

class HomeMainView extends StatelessWidget {
  const HomeMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: height * 1 / 6,
              child: ListView.separated(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
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
          InkWell(
            child: CircleAvatar(
              backgroundColor: AppColors.blue,
              radius: 42,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/h.jpg',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {},
          ),
          const Text('comidy'),
        ],
      );
  Widget buildpost(int index) => Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        'assets/images/ghaith.jpg',
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Haya Eid',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/ghaith.jpg',
                  height: 220,
                  width: 380,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Decstfgvmshgjhvgsfj nmgjhgvhv hj hj hjffggvhjgfcg gxdgfghjgjhgh fghfhgh ffcvbfd',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon:const Icon(AppIcons.basket,color:Colors.black,),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon:const Icon(AppIcons.thumbs_down,color: Colors.black,),
                      ),
                      IconButton(
                          onPressed: () {}, icon:  Icon(AppIcons.favorite,color: Colors.black,)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
