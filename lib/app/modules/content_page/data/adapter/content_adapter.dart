import '../../../../data/model/company.dart';
import '../../../../data/model/content.dart';

abstract class IContentRepository {
  Future<List<Content>> GetContent();
  Future<bool> DelContent(int id);
   Future<bool>AddContent(Content content);
}
