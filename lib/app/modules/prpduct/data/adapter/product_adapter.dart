import 'package:marful/app/modules/websit_company/data/model/Product.dart';

import '../../../../data/model/company.dart';
import '../../../../data/model/content.dart';

abstract class IProductRepository {
Future<List<Product>>getproducts(int idbrand);
Future<bool>addproduct(int idbrand,Product product);
Future<bool>delproduct(int idbrand,int idproduct);
}
 
  