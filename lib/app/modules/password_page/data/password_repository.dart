import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/websit_company/data/model/company.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';


abstract class IPasswordRepository {
  Future<List<Infulonser>> getdata();
  Future resetPassInful(Infulonser infulonser);
   Future resetPassComp(Company company);
    Future resetPassUser(UserModel userModel);
   Future<String> getEmail(String email) ;
}
