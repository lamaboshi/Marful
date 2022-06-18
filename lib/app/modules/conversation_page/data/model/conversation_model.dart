class ConversationModel {
  int? id;
  String? start;
  int? companyId;
  int? infulonserId;

  ConversationModel({
    this.id,
    this.start,
    this.companyId,
    this.infulonserId,
  });

  ConversationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    start = json['start'];
    companyId = json['companyId'];
    infulonserId = json['infulonserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start'] = this.start;
    data['companyId'] = this.companyId;
    data['infulonserId'] = this.infulonserId;
    return data;
  }
}
