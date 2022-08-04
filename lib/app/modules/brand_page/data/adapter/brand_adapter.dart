
import '../../../../data/model/Content.dart';
import '../../../../data/model/brand.dart';

abstract class IBrandRepository {
 Future<List<Content>> GetBrand();
  Future<bool> DelBrand(Brand brand);
   Future<bool>AddBrand(Brand brand);


}