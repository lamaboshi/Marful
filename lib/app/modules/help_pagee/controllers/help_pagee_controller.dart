import 'package:get/get.dart';

class HelpPageeController extends GetxController {
  List<String> screen = [
    'Homepage'.tr,
    'Profil'.tr,
    'Search'.tr,
    'Conversation'.tr,
    'Editprofil'.tr,
    'Content'.tr,
    'Brand'.tr,
    'Permission'.tr
  ];
  List<String> description = [
    'Viewpostsandinteractwiththem'.tr,
    'Viewprofileandnumberoffollowers'.tr,
    'Searchwithfilter'.tr,
    'Conversationbetweenacompanyandaninfluencer'.tr,
    'Editordeleteposts'.tr,
    'Addordeletecontent'.tr,
    'Addordeletebrand'.tr,
    'Add,deleteormodifypermission'.tr
  ];
  List<String> help = [
    'Theusercanseetheposts,interactwiththem,andgotothesiteinordertopurchasetheproductsinthepostTheinfluencerandthecompanycanalsoseethepostsandaddapostbyusingtheaddbuttonandwritingthepostinformation'.tr,
    'Thecompanyandtheinfluencerdisplaytheinformationofthepoststheyhavepublished,viewfollowersandtheirnumber,anddisplaythecontentstheyprovide'.tr,
    'Inthesearch,youcanfiltertheoutputbyclickingonthedesiredbuttonforaproduct,brand,influencerorcompany'.tr,
    'Theconversationisexclusivelybetweenacompanyandaninfluencertoconcludebusinessagreements'.tr,
    'Editpersonalinformation,andifitisacompanyorinfluencer,itcanmodifythecontentsandcanmodifytheinformationofpreviouspostsordeleteposts'.tr,
    'Theinfluencerandthecompanycanaddnewcontentbyusingtheaddbuttonandwritingthenameofthenewcontent,orhecandeletecontentbyusingthedeletebuttonandconfirmingit'.tr,
    'Theinfluencerandthecompanycanaddanewbrandthroughtheaddbuttonandwritetheinformationofthenewbrand,orhecandeleteaspecificbrandthroughthedeletebuttonandconfirmit'.tr,
    'Thecompanycanaddnewpermissionsbyusingtheaddbuttonandwritingthenewpermissioninformation,oritcandeleteaspecificpermissionthroughthedeletebuttonandconfirmit,oritcanmodifythepermission'.tr
  ];

 //  home='يستطيع المستخدم رؤية المنشورات والتفاعل معها والذهاب للموقع من اجل شراء المنتجات الموجودة في البوست.
  //  يستطيع المؤثر والشركة رؤية المنشورات ايضا واضافة منشور عن طريق زر الاضافة وكتابة معلومات المنشور'
  //content='يستطيع المؤثر والشركة اضافة محتوى جديد عن طريق زر الضافة وكتابة اسم المحتوى الجديد او يستطيع حذف محتوى عن طريق زر الحذف وتأكيده '
  //brand='يستطيع المؤثر والشركة اضافة ماركةجديد عن طريق زر الضافة وكتابة معلومات البراند الجديد او يستطيع حذف براند معين عن طريق زر الحذف وتأكيده '
  //permissions='تسطيع الشركة اضافة صلاحيات جديدة عن طريق زر الاضافة وكتابة معلومات الصلاحية الجديدة او تسطيع حذف صلاحية معينة عن طريق زر الحذف وتأكيده او تسطيع تعديل صلاحية'
  //search='في البحث تستطيع فلترة الناتج بالضغط على الزر المراد منتج او ماركة او مؤثر او شركة '
  //conversation='المحادثة حصرا بين شركة ومؤثر لعقد اتفاقيات العمل'
  //profil='يعرض لدى الشركة والؤثر معلومات المنشورات التي قاموا بنشرها وعرض المتابعين وعددهم وعرض المحتوياتالتي يقدموها'
  //edit profil='تعديل المعلومات الشخصية واذا كان شركة او مؤثر يمكنه تعديل المحتويات ويستطيع تعديل معلومات البوستات السابقة او حذف البوستات '
  RxInt index = 0.obs;
}
