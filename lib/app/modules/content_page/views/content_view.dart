import 'package:flutter/material.dart';

class ContentView extends StatelessWidget {
  const ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text('Haya Eid'),
                      leading: Image.asset(
                        'assets/images/b.jpg',
                        height: 90,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      subtitle:
                          Text('hiiiiiiiiiiii every body.... i am $index'),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
