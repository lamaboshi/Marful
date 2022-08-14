import 'package:get/get.dart';

class HelpPageeController extends GetxController {
  List<String> screen = [
    'Home page',
    'Profil ',
    'Search ',
    'Conversation ',
    'Edit profil',
    'Content',
    'Brand',
    'Permission'
  ];
  List<String> description = [
    'Posts',
    ' ',
    'Search ',
    'Conversation ',
    'Edit profil',
    'Content',
    'Brand',
    'Permission'
  ];
  List<String> help = [
    'The user can see the posts, interact with them, and go to the site in order to purchase the products in the post The influencer and the company can also see the posts and add a post by using the add button and writing the post information',
    'The company and the influencer display the information of the posts they have published, view followers and their number, and display the contents they provide',
    'In the search, you can filter the output by clicking on the desired button for a product, brand, influencer or company',
    'The conversation is exclusively between a company and an influencer to conclude business agreements',
    'Modify personal information, and if it is a company or influencer, it can modify the contents and can modify the information of previous posts or delete posts',
    'The influencer and the company can add new content by using the add button and writing the name of the new content, or he can delete content by using the delete button and confirming it',
    'The influencer and the company can add a new brand through the add button and write the information of the new brand, or he can delete a specific brand through the delete button and confirm it',
    'The company can add new permissions by using the add button and writing the new permission information, or it can delete a specific permission through the delete button and confirm it, or it can modify the permission'
  ];

  // home='يستطيع المستخدم رؤية المنشورات والتفاعل معها والذهاب للموقع من اجل شراء المنتجات الموجودة في البوست.
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
