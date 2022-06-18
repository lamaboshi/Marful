import 'package:flutter/material.dart';

class HomePostView extends StatelessWidget {
  const HomePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        padding: const EdgeInsets.all(15),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                 Align(
                  alignment: Alignment.topLeft,
                  child: Text("Write a post"),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
