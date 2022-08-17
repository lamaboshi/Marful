import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:marful/app/modules/intro_page/controllers/intro_controller.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';

class IntroPage extends GetView<IntroController> {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          interPage(context),
          interInfluncerPage(context),
          interCompanyPage(context),
          interUserPage(context)
        ],
        onDone: () {
          Get.rootDelegate.offNamed(Routes.HAYA);
        },
        showNextButton: true,
        showBackButton: true,
        showSkipButton: false,
        back: Text("Back".tr,
            style: const TextStyle(
                color: AppColors.blue, fontWeight: FontWeight.w600)),
        next: Text("Next".tr,
            style: const TextStyle(
                color: AppColors.blue, fontWeight: FontWeight.w600)),
        done: Text("Done".tr,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: AppColors.blue)),
        globalBackgroundColor: Colors.white,
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

//interpage
PageViewModel interPage(context) {
  final height = MediaQuery.of(context).size.height;
  return PageViewModel(
    decoration: const PageDecoration(
      pageColor: Colors.white,
      imagePadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      imageFlex: 1,
      titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
      contentMargin: EdgeInsets.all(20),
      footerPadding: EdgeInsets.fromLTRB(0, 20, 0, 90),
      imageAlignment: Alignment.topLeft,
      bodyFlex: 0,
      bodyAlignment: Alignment.topLeft,
      bodyPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    ),
    //text
    image: Center(
      child: Image.asset(
        'assets/images/intro.gif',
        height: height * 1.43 / 3,
      ),
    ),

    ///image
    titleWidget: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'YouCanChooseAcountToSignUp'.tr,
          style: const TextStyle(fontSize: 15),
        )),

    ///text
    bodyWidget: const SizedBox(
      height: 0,
    ),
    footer: Row(
      children: [
        //Influencer
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 3),
          child: SizedBox(
            width: 130,
            height: 38,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.orange),
              ),
              onPressed: () {
                Get.rootDelegate.offNamed(Routes.SignUpInfluencer);
              },
              child: Text(
                "Influencer".tr,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
        //company
        Padding(
          padding: const EdgeInsets.only(left: 3, right: 3),
          child: SizedBox(
            width: 130,
            height: 38,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.orange),
              ),
              onPressed: () {
                Get.rootDelegate.offNamed(Routes.SignUpCompany);
              },
              child: Text(
                "Company".tr,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
        //user
        Padding(
          padding: const EdgeInsets.only(left: 3, right: 0),
          child: SizedBox(
            width: 120,
            height: 38,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.orange),
              ),
              onPressed: () {
                Get.rootDelegate.offNamed(Routes.SignUpUserPage);
              },
              child: Text(
                "User".tr,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

//inter Influncer page
PageViewModel interInfluncerPage(context) {
  final height = MediaQuery.of(context).size.height;
  return PageViewModel(
    decoration: const PageDecoration(
      pageColor: Colors.white,
      imagePadding: EdgeInsets.fromLTRB(20, 35, 20, 20),
      imageFlex: 0,
      titlePadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      contentMargin: EdgeInsets.all(20),
      footerPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      imageAlignment: Alignment.topLeft,
      bodyFlex: 0,
      bodyAlignment: Alignment.center,
      bodyPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
    ),
    image: Text('BeInfluencer'.tr,
        textAlign: TextAlign.start,
        style: const TextStyle(
            color: AppColors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 45.0)),
    //image
    titleWidget: Center(
      child: Image.asset(
        'assets/images/influencerr.gif',
        height: height * 1.25 / 3,
      ),
    ),
    //text
    bodyWidget: Text(
        'AContentCreatorissomeonewhosharesinformationandussuallytargetsspecificusers.acontentcreatorcancreatediffrenttypesofcontent'
            .tr),

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
              // Get.to(() => SignUpInfluencer());
              Get.rootDelegate.offNamed(Routes.SignUpInfluencer);
            },
            child: Text(
              "SignUpAsInfluencer".tr,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),

        ///you Have Account? sign in
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('youHaveAccount?'.tr,
                style: const TextStyle(
                  color: Colors.grey,
                )),
            const SizedBox(
              width: 3,
            ),
            InkWell(
              child: Text(
                'signin'.tr,
                style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {
                Get.rootDelegate.offNamed(Routes.SignIn);
              },
            ),
          ],
        ),
      ],
    ),
  );
}

//inter company page
PageViewModel interCompanyPage(context) {
  final height = MediaQuery.of(context).size.height;
  return PageViewModel(
    decoration: const PageDecoration(
      pageColor: Colors.white,
      imagePadding: EdgeInsets.fromLTRB(20, 35, 20, 20),
      imageFlex: 0,
      titlePadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      contentMargin: EdgeInsets.all(20),
      footerPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      imageAlignment: Alignment.topLeft,
      bodyFlex: 0,
      bodyAlignment: Alignment.center,
      bodyPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
    ),
    image: Text('BeCompany'.tr,
        textAlign: TextAlign.start,
        style: const TextStyle(
            color: AppColors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 45.0)),
    //image
    titleWidget: Center(
      child: Image.asset(
        'assets/images/aa.gif',
        height: height * 1.25 / 3,
      ),
    ),

    bodyWidget: Text(
        'thecompanyconsistsofmorethanonepersonanditisabrandthatpromotesitisproduct'
            .tr),
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
              Get.rootDelegate.offNamed(Routes.SignUpCompany);
            },
            child: Text(
              "SignUpAsCompany".tr,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),

        ///you Have Account? sign in
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('youHaveAccount?'.tr,
                style: const TextStyle(
                  color: Colors.grey,
                )),
            const SizedBox(
              width: 3,
            ),
            InkWell(
              child: Text(
                'signin'.tr,
                style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {
                Get.rootDelegate.offNamed(Routes.SignIn);
              },
            ),
          ],
        ),
      ],
    ),
  );
}

//inter user page
PageViewModel interUserPage(context) {
  final height = MediaQuery.of(context).size.height;
  return PageViewModel(
    decoration: const PageDecoration(
      pageColor: Colors.white,
      imagePadding: EdgeInsets.fromLTRB(20, 35, 20, 20),
      imageFlex: 0,
      titlePadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      contentMargin: EdgeInsets.all(20),
      footerPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      imageAlignment: Alignment.topLeft,
      bodyFlex: 0,
      bodyAlignment: Alignment.center,
      bodyPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
    ),
    image: Text('BeUser'.tr,
        textAlign: TextAlign.start,
        style: const TextStyle(
            color: AppColors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 45.0)),

    ///image
    titleWidget: Center(
      child: Image.asset(
        'assets/images/user.gif',
        height: height * 1.25 / 3,
      ),
    ),

    ///text
    bodyWidget: Text('theuserfollowscopaniesandcontentmakers'.tr),

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
              Get.rootDelegate.offNamed(Routes.SignUpUserPage);
            },
            child: Text(
              "SignUpAsUser".tr,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),

        ///you Have Account? sign in
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('youHaveAccount?'.tr,
                style: const TextStyle(
                  color: Colors.grey,
                )),
            const SizedBox(
              width: 3,
            ),
            InkWell(
              child: Text(
                'signin'.tr,
                style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {
                Get.rootDelegate.offNamed(Routes.SignIn);
              },
            ),
          ],
        ),
      ],
    ),
  );
}
