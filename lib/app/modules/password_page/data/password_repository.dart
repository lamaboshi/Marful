import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/modules/websit_company/data/model/company.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';


abstract class IPasswordRepository {
  Future<List<Infulonser>> getdata();
}
