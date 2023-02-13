class Pokemon {
  String? name;
  String? thumbnailImage;
  String? number;
  String? description;
  List<String>? types;
  List<String>? weakness;

  Pokemon(
      {this.name,
      this.thumbnailImage,
      this.number,
      this.description,
      this.types,
      this.weakness});
  Pokemon.fromJson(Map<String, dynamic> json) {
    weakness = json['weakness'].cast<String>();
    number = json['number'];
    description = json['description'];
    name = json['name'];
    thumbnailImage = json['thumbnailImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weakness'] = weakness;
    data['number'] = number;
    data['description'] = description;
    data['name'] = name;
    data['thumbnailImage'] = thumbnailImage;
    return data;
  }
}
