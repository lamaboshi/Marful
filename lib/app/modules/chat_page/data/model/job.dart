import 'package:marful/app/modules/chat_page/data/model/message_model.dart';

class Job {
  int? id;
  double? salary;
  String? code;
  int? brandId;
  int? infulonserId;
  List<Message>? messages;
  Job(
      {this.id,
      this.salary,
      this.code,
      this.brandId = 0,
      this.infulonserId = 0,
      this.messages});
  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salary = double.parse(json['salary'].toString());
    code = json["code"];
    brandId = json['brandId'];
    infulonserId = json['infulonserId'];
    messages = json["messages"] == null
        ? null
        : List<Message>.from((json["messages"] as Iterable)
            .map((x) => Message.fromJson(x as Map<String, dynamic>)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id == null ? 0 : this.id;
    data['salary'] = this.salary;
    data['code'] = this.code;
    data['brandId'] = this.brandId;
    data['infulonserId'] = this.infulonserId;
    data["messages"] =
        messages == null ? [] : List.from(messages!.map((x) => x.toJson()));
    return data;
  }
}
