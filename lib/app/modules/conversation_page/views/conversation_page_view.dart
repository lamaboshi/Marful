import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/sheard/date_extation.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/conversation_page_controller.dart';

class ConversationPageView extends GetView<ConversationPageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          title: Text('ConversationPage'.tr),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  controller.getAllConversations();
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : Wrap(
                children: controller.allConversations
                    .map(
                      (element) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Get.rootDelegate.toNamed(
                                Routes.CHAT_PAGE,
                                arguments: element.id.toString(),
                              );
                            },
                            child: SizedBox(
                                height: 250,
                                width: 200,
                                child: Stack(
                                  children: [
                                    //image
                                    Positioned.fill(
                                        child: Image.asset(
                                      fit: BoxFit.cover,
                                      'assets/images/backgroundChat.png',
                                    )),
                                    //overlay
                                    Positioned.fill(
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: <Color>[
                                                  AppColors.blue,
                                                  Colors.transparent
                                                ],
                                                stops: const [0.15, 0.35],
                                              ),
                                            ),
                                          )),
                                    ),
                                    //name
                                    Positioned(
                                      bottom: 4,
                                      left: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.auth.personType() ==
                                                    'infulonser'
                                                ? element.company!.name!
                                                : controller.auth
                                                            .personType() ==
                                                        'comapny'
                                                    ? element
                                                        .infulonser!.userName!
                                                    : '',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            getFormattedDate(
                                                DateTime.parse(element.start!)),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))),
                      ),
                    )
                    .toList())));
  }
}
