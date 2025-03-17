class PrudctModel {
  final String id;
  final String title;
  final String dec;
  final String price;
  final String img;
  PrudctModel({
    required this.id,
    required this.title,
    required this.dec,
    required this.price,
    required this.img,
  });

  factory PrudctModel.fromjson(Map<String, dynamic> json) {
    return PrudctModel(
      id: json["id"],
      title: json["name"],
      dec: json["dec"],
      price: json["price"],
      img: json["image"],
    );
  }
}
