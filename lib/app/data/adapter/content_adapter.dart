import '../model/content.dart';

abstract class IContenteRpository {
  Future<List<Content>> getContent();
}
