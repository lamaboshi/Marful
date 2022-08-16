import 'company_type.dart';

abstract class ICompanyTypeRepository {
  Future<void> addCompanyType(CompanyTypeModel companyType);
  Future<void> deleteCompanyType(int idcompanyType);
  Future<List<CompanyTypeModel>> getCompanyType(int idcompany);
}
