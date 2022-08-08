class Message {
  int? id;
  String? text;
  DateTime? sendTime;
  bool? messageStatus;
  int? jobId;
  int? conversationId;
  Message(
      {this.id,
      this.sendTime,
      this.text,
      this.messageStatus,
      this.jobId = 0,
      this.conversationId = 0});
  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    sendTime = json["sendTime"] == null
        ? null
        : DateTime.parse(json["sendTime"].toString());
    messageStatus = json['messageStatus'];
    jobId = json['jobId'];
    conversationId = json['conversationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['sendTime'] = this.sendTime!.toIso8601String();
    data['messageStatus'] = this.messageStatus;
    data['jobId'] = this.jobId;
    data['conversationId'] = this.conversationId;
    return data;
  }
}
