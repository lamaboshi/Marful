class Content {
  int? id;
  String? name;
  String? description;

  Content({
    this.id,
    this.description,
    this.name,
  });

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = id == null ? 0 : id;
    json['name'] = name;
    json['description'] = description;
    return json;
  }
}
