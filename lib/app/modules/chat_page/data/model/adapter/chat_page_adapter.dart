import 'package:marful/app/modules/chat_page/data/model/job.dart';

abstract class IChatPageRepository {
  Future<void> addJob(Job job);
}
