
import '../../../../data/model/Content.dart';
import '../../../../data/model/brand.dart';

abstract class IBrandRepository {
 Future<List<Brand>> GetBrand();
  Future<bool> DelBrand(int id);
   Future<bool>AddBrand(Brand brand);


}