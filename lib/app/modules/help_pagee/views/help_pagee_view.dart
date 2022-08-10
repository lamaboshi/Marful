import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/help_pagee_controller.dart';

class HelpPageeView extends StatelessWidget {
  const HelpPageeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<String> help = ['hiiiiiiiiiii', 'hhhhhhhhhhhhhh'];
    // int ind = 1;

    return Scaffold(
      //   backgroundColor: Colors.grey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Spacer(),
              Text(
                'The main page ',
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'you can interact and see influencer posts who have followed them and shopping products ',
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'you can classify the content of the posts that will appear ',
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'influencer and company can add post with a picture and certain brand if it contain a producte ',
                style: TextStyle(fontSize: 19),
              ),
              Spacer(),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.orange),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text('Next'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.orange),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text('Back'),
                  ),
                ],
              ), //Spacer(),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
