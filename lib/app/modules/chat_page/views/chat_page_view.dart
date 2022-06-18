import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/values/app_colors.dart';

import '../controllers/chat_page_controller.dart';

class ChatPageView extends GetView<ChatPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          title: Text('ConversationPageView'),
          centerTitle: true,
        ),
        body: Stack(children: [
          //image
          Positioned.fill(
              child: Image.asset(
            fit: BoxFit.cover,
            'assets/images/backgroundChat.png',
          )),
          Container(
            color: Colors.white.withOpacity(0.4),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox.shrink(),
                      Card(
                        color: AppColors.blue.withOpacity(0.4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'hi thanke you very match for this it was nice one',
                              style: TextStyle(fontSize: 17)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: AppColors.orange.withOpacity(0.7),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'hi thanke you very match for this it was nice one',
                              style: TextStyle(fontSize: 17)),
                        ),
                      ),
                      SizedBox.shrink(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox.shrink(),
                      Card(
                        color: AppColors.blue.withOpacity(0.4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'hi thanke you very match for this it was nice one',
                              style: TextStyle(fontSize: 17)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: AppColors.orange.withOpacity(0.7),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'hi thanke you very match for this it was nice one',
                              style: TextStyle(fontSize: 17)),
                        ),
                      ),
                      SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
