import '../../../../data/model/company.dart';

abstract class ContentRepository {
  Future<List<Content>> GetContent();
  Future<bool> DelContent(Content content);
   Future<bool>AddContent(Content content);
}
