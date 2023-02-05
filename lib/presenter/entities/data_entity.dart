class DataEntity {
  String? name;
  String? thumbnailImage;
  String? number;
  String? description;
  List<String>? types;
  List<String>? weakness;

  DataEntity(
      {this.name,
      this.thumbnailImage,
      this.number,
      this.description,
      this.types,
      this.weakness});
}
