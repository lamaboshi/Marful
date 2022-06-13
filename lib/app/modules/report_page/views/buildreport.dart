import 'package:flutter/material.dart';

class BuildReport extends StatelessWidget {
  const BuildReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: const Text('Haya Eid'),
              trailing: const Text('11/12/2020'),
              subtitle: Text('hiiiiiiiiiiii every body.... i am $index'),
            ),
          );
        },
      ),
    );
  }
}
