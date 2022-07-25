import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/profile_controller.dart';

class BuildPost extends GetResponsiveView<ProfileController> {
  BuildPost(
      {this.infoname = '',
      this.description = '',
      this.isEdit = false,
      super.key});
  final String infoname;
  final String description;
  final bool isEdit;
  @override
  Widget builder() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        height: screen.height / 2.5,
        child: Card(
          elevation: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/images/8.jpg",
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          infoname == null ? '' : infoname,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    isEdit
                        ? SizedBox(
                            width: 70,
                            child: QExpander(
                                child: Icon(
                                  Icons.more_vert_rounded,
                                  color: AppColors.orange,
                                ),
                                expandChild: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Text('Edit'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Text('Delete'),
                                      )
                                    ],
                                  ),
                                )),
                          )
                        : SizedBox.shrink()
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Text(
                  description,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Image.asset(
                width: screen.width - 34,
                height: screen.height / 3.74,
                'assets/images/angryimg.png',
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
