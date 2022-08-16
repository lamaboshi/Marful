import '../../../../data/model/brand.dart';

abstract class IBrandRepository {
  Future<List<Brand>> getAllBrand(int idComp);
  Future<bool> DelBrand(int id);
  Future<bool> AddBrand(Brand brand);
}
