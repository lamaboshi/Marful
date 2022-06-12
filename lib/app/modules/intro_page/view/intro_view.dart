import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:marful/app/modules/intro_page/controllers/intro_controller.dart';
import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';

class IntroPage extends GetView<IntroController> {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: IntroductionScreen(
        pages: page(context),
        
        onDone: () {
         // Get.toNamed(Routes.HomePage);
      
        },
        // onSkip: () {
        //   Get.toNamed(Routes.SignUpUserPage);
        // },
        showNextButton: true,
        showBackButton: true,
        showSkipButton: false,
        back: const Text("Back",
            style:
                TextStyle(color: AppColors.blue, fontWeight: FontWeight.w600)) ,
       next: const Text("Next",
            style:
                TextStyle(color: AppColors.blue, fontWeight: FontWeight.w600)), 
        // skip: const Text("Skip",
        //     style:
        //         TextStyle(color: AppColors.blue, fontWeight: FontWeight.w600)),
        done: const Text("Done",
            style:
                TextStyle(fontWeight: FontWeight.w600, color: AppColors.blue)),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: AppColors.blue,
          activeColor: AppColors.blue,
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}

List<PageViewModel> page(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return [
    //////الاسم
    // PageViewModel(
    //   decoration: const PageDecoration(
    //       imagePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    //       imageFlex: 0,
    //       titlePadding: EdgeInsets.only(top: 0, bottom: 0),
    //       contentMargin: EdgeInsets.all(0),
    //       footerPadding: EdgeInsets.all(0),
    //       imageAlignment: Alignment.topLeft,
    //       bodyFlex: 0,
    //       bodyPadding: EdgeInsets.fromLTRB(0, 0, 0, 00),
    //       //   pageColor: AppColors.orange,
    //       titleTextStyle: TextStyle(
    //           color: Colors.orange,
    //           fontWeight: FontWeight.w700,
    //           fontSize: 25.0)),
    //   image: SizedBox(
    //     height: height * .5,
    //   ),
    //   titleWidget: Padding(
    //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: const [
    //         Text('Mar',
    //             style: TextStyle(
    //                 color: AppColors.orange,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 45.0)),
    //         SizedBox(
    //           width: 5,
    //         ),
    //         Text('Flu',
    //             style: TextStyle(
    //                 color: AppColors.blue,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 45.0)),
    //       ],
    //     ),
    // //////تسجيل الدخول او حساب
    PageViewModel(
      decoration: const PageDecoration(
        imagePadding: EdgeInsets.fromLTRB(20, 40, 20, 40),
        imageFlex: 0,
        titlePadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        contentMargin: EdgeInsets.all(20),
        footerPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        imageAlignment: Alignment.topLeft,
        bodyFlex: 0,
        bodyAlignment: Alignment.center,
        bodyPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      ),
      ///
      image: const Text('Be Influencer',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 45.0)),
      ///image
      titleWidget: Center(
        child: Image.asset(
          'assets/images/Selfie.gif',
          height: height *1.25/ 3,
        ),
      ),

      ///text
      bodyWidget: const Text(
          'Here you can write the description of the page, to explain someting...'),
      footer: Column(
        children: [
          ///btn Sign Up As Influencer
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.orange),
                fixedSize: MaterialStateProperty.all(Size.fromWidth(height)),
              ),
              onPressed: () {
                Get.toNamed(Routes.SignUpInfluencer);
              },
              child: const Text(
                "Sign Up As Influencer",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          ///you Have Account? sign in
          InkWell(
            child: const Text(
              'You Have Account? Sign In',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              Get.toNamed(Routes.SignIn);
            },
          ),
        ],
      ),
    ),
    /////company
    PageViewModel(
      decoration: const PageDecoration(
        imagePadding: EdgeInsets.fromLTRB(20, 40, 20, 40),
        imageFlex: 0,
        titlePadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        contentMargin: EdgeInsets.all(20),
        footerPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        imageAlignment: Alignment.topLeft,
        bodyFlex: 0,
        bodyAlignment: Alignment.center,
        bodyPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      ),
      ///
      image: const Text('Be Company',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 45.0)),
      ///image
      titleWidget: Center(
        child: Image.asset(
          'assets/images/Company.gif',
          height: height *1.25/ 3,
        ),
      ),

      ///text
      bodyWidget: const Text(
          'Here you can write the description of the page, to explain someting...'),
      footer: Column(
        children: [
          ///btn Sign Up As Company
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.orange),
                fixedSize: MaterialStateProperty.all(Size.fromWidth(height)),
              ),
              onPressed: () {
                Get.toNamed(Routes.SignUpCompany);
              },
              child: const Text(
                "Sign Up As Company",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          ///you Have Account? sign in
          InkWell(
            child: const Text(
              'You Have Account? Sign In',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              Get.toNamed(Routes.SignIn);
            },
          ),
        ],
      ),
    ),
    ////user
    PageViewModel(
      decoration: const PageDecoration(
       
        imagePadding: EdgeInsets.fromLTRB(20, 40, 20, 40),
        imageFlex: 0,
        titlePadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        contentMargin: EdgeInsets.all(20),
        footerPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        imageAlignment: Alignment.topLeft,
        bodyFlex: 0,
        bodyAlignment: Alignment.center,
        bodyPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      ),

      ///
      image: const Text('Be User',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 45.0)),

      ///image
      titleWidget: Center(
        child: Image.asset(
          'assets/images/In no time.gif',
         height: height *1.25/ 3,
        ),
      ),

      ///text
      bodyWidget: const Text(
          'Here you can write the description of the page, to explain someting...'),
      footer: Column(
        children: [
          ///btn Sign Up As User
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.orange),
                fixedSize: MaterialStateProperty.all(Size.fromWidth(height)),
              ),
              onPressed: () {
                Get.toNamed(Routes.SignUpUserPage);
              },
              child: const Text(
                "Sign Up As User",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          ///you Have Account? sign in
          InkWell(
            child: const Text(
              'You Have Account? Sign In',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              Get.toNamed(Routes.SignIn);
            },
          ),
        ],
      ),
    ),
  ];
}





  // appBar: AppBar(
      //   bottom: TabBar(tabs: [
      //     Tab(
      //       icon: const Icon(Icons.home),
      //     ),
      //     Tab(
      //       icon: const Icon(Icons.search),
      //     ),
      //     Tab(
      //       icon: const Icon(Icons.search),
      //     )
      //   ]),
      //   title: const Text('MarFlu'),
      //   actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      // ),