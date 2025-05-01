import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {

  List<ProductModel>? products;


  ProductsResponse(
      {
        this.products
      });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
@JsonSerializable()
class ProductModel {
  int? id;
  String? title;
  String? description;
  String? thumbnail;
  double? price;
  List<String>? images;
  ProductModel({
    this.title,
    this.id,
    this.images,
    this.description,
    this.price,
    this.thumbnail
});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

}