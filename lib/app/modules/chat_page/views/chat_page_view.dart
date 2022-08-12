import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/component/textField.dart';
import 'package:marful/app/core/values/app_colors.dart';
import 'package:marful/sheard/auth_service.dart';
import 'package:marful/sheard/date_extation.dart';
import 'package:q_overlay/q_overlay.dart';

import '../controllers/chat_page_controller.dart';

class ChatPageView extends GetView<ChatPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: Text('ConversationPage'.tr),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                QPanel(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('NewJobAgreement'.tr,
                            style: TextStyle(fontSize: 20)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldWidget(
                              onChanged: (txt) {
                                controller.newJob.value.salary =
                                    double.parse(txt);
                              },
                              type: TextInputType.multiline,
                              hint: 'salary'.tr,
                              obscureText: false,
                              prefIcon: Icons.money,
                            ),
                            TextFieldWidget(
                              onChanged: (txt) {
                                controller.newJob.value.code = txt;
                              },
                              type: TextInputType.multiline,
                              hint: 'code'.tr,
                              obscureText: false,
                              prefIcon: Icons.money,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton.extended(
                              onPressed: () {
                                controller.addJob();
                              },
                              label: Text('buildPostSave'.tr)),
                        )
                      ],
                    )).show();
              },
              icon: Icon(Icons.work))
        ],
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
                                  child: messageSender(element.text!,
                                      element.sendTime!, element.jobId != null),
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
                                  child: messageRecover(element.text!,
                                      element.sendTime!, element.jobId != null),
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

  Widget messageSender(String text, DateTime date, bool hasjiob) => Padding(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(getFormattedDate(date),
                            style: TextStyle(fontSize: 12)),
                      ),
                      hasjiob ? Icon(Icons.star) : SizedBox.shrink()
                    ],
                  ),
                ],
              ),
            ),
            SizedBox.shrink(),
          ],
        ),
      );
  Widget messageRecover(String text, DateTime date, bool hasjiob) => Padding(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(getFormattedDate(date),
                            style: TextStyle(fontSize: 12)),
                      ),
                      hasjiob ? Icon(Icons.star) : SizedBox.shrink()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
