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
        title: const Text('ConversationPageView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.getAllCompanyContent();
                QPanel(
                    width: 400,
                    alignment: Alignment.center,
                    child: Obx(() => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('New Job Agreement',
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      child: Row(
                                    children: [
                                      const Icon(
                                        Icons.connected_tv,
                                        color: AppColors.orange,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      QExpander(
                                          expandChild: Column(
                                            children: controller.companyContent
                                                .map((element) => InkWell(
                                                    onTap: () {
                                                      controller
                                                          .selectcompanyContent(
                                                              element);
                                                      controller.getAllBrand(
                                                          element.id!);
                                                    },
                                                    child: Text(element
                                                        .content!.name!)))
                                                .toList(),
                                          ),
                                          child: Text(
                                            controller
                                                    .selectcompanyContent()
                                                    .content!
                                                    .name!
                                                    .isEmpty
                                                ? 'Content Company'
                                                : controller
                                                    .selectcompanyContent()
                                                    .content!
                                                    .name!,
                                            style: TextStyle(fontSize: 17),
                                          )),
                                    ],
                                  )),
                                ),
                                controller.brands.isEmpty
                                    ? const SizedBox.shrink()
                                    : SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.branding_watermark,
                                                color: AppColors.orange,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              QExpander(
                                                  expandChild: Column(
                                                    children: controller.brands
                                                        .map((element) =>
                                                            InkWell(
                                                                onTap: () {
                                                                  controller
                                                                      .selectbrand(
                                                                          element);
                                                                },
                                                                child: Text(
                                                                    element
                                                                        .name!)))
                                                        .toList(),
                                                  ),
                                                  child: Text(controller
                                                          .selectbrand()
                                                          .name!
                                                          .isEmpty
                                                      ? 'Brand Company'
                                                      : controller
                                                          .selectbrand()
                                                          .name!)),
                                            ],
                                          ),
                                        ),
                                      ),
                                TextFieldWidget(
                                  onChanged: (txt) {
                                    controller.newJob.value.salary =
                                        double.parse(txt);
                                  },
                                  type: TextInputType.multiline,
                                  hint: 'percentage %',
                                  obscureText: false,
                                  prefIcon: Icons.money,
                                ),
                                TextFieldWidget(
                                  onChanged: (txt) {
                                    controller.newJob.value.code = txt;
                                  },
                                  type: TextInputType.multiline,
                                  hint: 'code',
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
                                  label: const Text('Save')),
                            )
                          ],
                        ))).show();
              },
              icon: const Icon(Icons.work))
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
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.orange)),
                                hintText: 'Hi',
                                prefixIcon: Icon(Icons.message,
                                    color: AppColors.orange),
                                prefixText: ' ',
                                suffixStyle:
                                    TextStyle(color: AppColors.orange)),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                              onPressed: () async {
                                await controller.addMessage();
                              },
                              icon: const Icon(
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
                    child: Text(text, style: const TextStyle(fontSize: 17)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(getFormattedDate(date),
                            style: const TextStyle(fontSize: 12)),
                      ),
                      hasjiob ? const Icon(Icons.star) : const SizedBox.shrink()
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox.shrink(),
          ],
        ),
      );
  Widget messageRecover(String text, DateTime date, bool hasjiob) => Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            Card(
              color: AppColors.blue.withOpacity(0.4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text, style: const TextStyle(fontSize: 17)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(getFormattedDate(date),
                            style: const TextStyle(fontSize: 12)),
                      ),
                      hasjiob ? const Icon(Icons.star) : const SizedBox.shrink()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
