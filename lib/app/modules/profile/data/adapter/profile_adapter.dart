import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';

import '../../../../data/model/content.dart';

abstract class IProfailRepository {
Future<List<Content>> GetInfulConent(int IdInful);
Future<List<Content>> GetCompanyConent(int idCompany);
Future<List<Post>>GetInfulPost(int idInful);
Future<List<Post>>GetCompPost(int idCompany);
}