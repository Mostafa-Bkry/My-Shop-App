import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String title;
  String description;
  double price;
  String image;
  String category;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.image,
      required this.category});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  toJson() => _$ProductToJson(this);
}
