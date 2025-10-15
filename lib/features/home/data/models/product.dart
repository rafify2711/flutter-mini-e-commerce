import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';
@JsonSerializable()
class Product {
  const Product({this.id, this.title, this.price, this.description, this.category, this.image, this.rating});

  final int? id;
  final String? title;
  final double? price ;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;


  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Rating {
  const Rating({this.rate, this.count});

  final double? rate;
  final int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
