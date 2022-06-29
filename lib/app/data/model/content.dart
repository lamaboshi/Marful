class Content {
  int? id;
  String? name;
  String? description;

  Content({
    required this.id,
    required this.description,
  });

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = id;
    json['name'] = name;
    json['description'] = description;
    return json;
  }
}
