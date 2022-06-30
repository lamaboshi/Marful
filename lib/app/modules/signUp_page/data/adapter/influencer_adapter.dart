import 'package:marful/app/data/model/infulonser.dart';

abstract class IInfluencerRepository {
  Future<bool> regierterInfluencer(Infulonser object);
}
