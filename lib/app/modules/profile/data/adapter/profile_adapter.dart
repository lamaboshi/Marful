import '../../../../data/model/content.dart';

abstract class IProfailRepository {
Future<List<Content>> GetInfulConent(int IdInful);
Future<List<Content>> GetCompanyConent(int idCompany);
}