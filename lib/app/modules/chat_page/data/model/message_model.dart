class MessageModel {
  int? id;
  String? text;
  DateTime? sendTime;
  bool? messageStatus;
  MessageModel({
    this.id,
    this.sendTime,
    this.text,
    this.messageStatus,
  });
  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    sendTime = json["sendTime"] == null
        ? null
        : DateTime.parse(json["sendTime"].toString());
    messageStatus = json['messageStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['sendTime'] = this.sendTime;
    data['messageStatus'] = this.messageStatus;
    return data;
  }
}
