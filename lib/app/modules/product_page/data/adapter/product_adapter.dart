import 'package:marful/app/modules/websit_company/data/model/Product.dart';

abstract class IProductRepository {
  Future<List<Product>> getproducts(int idbrand);
  Future<bool> addproduct(Product product);
  Future<bool> delproduct(int idproduct);
}
