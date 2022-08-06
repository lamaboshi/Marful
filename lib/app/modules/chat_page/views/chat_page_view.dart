import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marful/app/core/values/app_colors.dart';
import 'package:marful/sheard/auth_service.dart';

import '../controllers/chat_page_controller.dart';

class ChatPageView extends GetView<ChatPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: Text('ConversationPageView'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.work))],
      ),
      body: Stack(
        children: [
          //image
          Positioned.fill(
              child: Image.asset(
            fit: BoxFit.cover,
            'assets/images/backgroundChat.png',
          )),

          Column(
            children: [
              Expanded(
                flex: 11,
                child: SingleChildScrollView(
                    child: Container(
                  color: Colors.white.withOpacity(0.4),
                  child: Obx(() => controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: controller.allMessage.map((element) {
                            if (!element.messageStatus! &&
                                controller.typeAuth.value == Auth.infulonser) {
                              return InkWell(
                                onTap: () {
                                  if (controller.selectMessage
                                      .contains(element)) {
                                    controller.selectMessage.remove(element);
                                  } else {
                                    controller.selectMessage.add(element);
                                  }
                                },
                                child: Container(
                                  color:
                                      controller.selectMessage.contains(element)
                                          ? Colors.grey.withOpacity(0.8)
                                          : Colors.transparent,
                                  child: messageSender(
                                      element.text!, element.sendTime!),
                                ),
                              );
                            } else {
                              return InkWell(
                                onTap: () {
                                  if (controller.selectMessage
                                      .contains(element)) {
                                    controller.selectMessage.remove(element);
                                  } else {
                                    controller.selectMessage.add(element);
                                  }
                                },
                                child: Container(
                                  color:
                                      controller.selectMessage.contains(element)
                                          ? Colors.grey.withOpacity(0.8)
                                          : Colors.transparent,
                                  child: messageRecover(
                                      element.text!, element.sendTime!),
                                ),
                              );
                            }
                          }).toList(),
                        )),
                )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: TextField(
                            onChanged: (value) {
                              controller.textMessage.value = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.orange)),
                                hintText: 'Hi',
                                prefixIcon: const Icon(Icons.message,
                                    color: AppColors.orange),
                                prefixText: ' ',
                                suffixStyle:
                                    const TextStyle(color: AppColors.orange)),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                              onPressed: () async {
                                await controller.addMessage();
                              },
                              icon: Icon(
                                Icons.send,
                                color: AppColors.orange,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget messageSender(String text, DateTime date) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: AppColors.orange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text, style: TextStyle(fontSize: 17)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(formattedTime(date),
                        style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
            SizedBox.shrink(),
          ],
        ),
      );
  Widget messageRecover(String text, DateTime date) => Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox.shrink(),
            Card(
              color: AppColors.blue.withOpacity(0.4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text, style: TextStyle(fontSize: 17)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(formattedTime(date),
                        style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  String formattedTime(DateTime date) => DateFormat.Hm().format(date);
}
