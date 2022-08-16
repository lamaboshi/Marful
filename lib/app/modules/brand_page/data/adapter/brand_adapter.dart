import '../../../../data/model/brand.dart';

abstract class IBrandRepository {
  Future<List<Brand>> getAllBrand(int idComp);
  Future<List<Brand>> getAllBrandInfo(int idInfo);
  Future<bool> DelBrand(int id);
  Future<bool> AddBrand(Brand brand);
}
