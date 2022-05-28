import '../model/Product.dart';

abstract class IWebsiteCompanyRepository {
  Future<List<Product>> getdata();
}
