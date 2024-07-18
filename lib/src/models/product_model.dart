import 'dart:convert';

import 'package:read_api_fake_store/src/models/rating_model.dart';
import 'package:read_api_fake_store/src/utils/enums/enums_category.dart';

/// Convierte un json a una lista de tipo [ProductModel]
List<ProductModel> productsModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

/// Convierte una lista de [ProductModel] a un json
String productsModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Convierte un json a un objeto de tipo [ProductModel]
ProductModel productModelFromJson(String str) =>
    ProductModel.fromJsonAdd(json.decode(str));

/// Convierte un objeto de tipo [ProductModel] a un json
String productModelToJson(ProductModel data) => json.encode(data.toAddJson());

class ProductModel {
  ProductModel({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
  });

  int? id;
  String title;
  double price;
  String description;
  CategoryEnum category;
  String image;
  RatingModel? rating;

  /// Convertir un json a un objeto de tipo [ProductModel]
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category:
            categoryValues.map[json["category"]] ?? CategoryEnum.electronics,
        image: json["image"],
        rating: json["rating"] != null
            ? RatingModel.fromJson(json["rating"])
            : null,
      );

  /// Convertir un json a un objeto de tipo [ProductModel] para agregar un producto
  factory ProductModel.fromJsonAdd(Map<String, dynamic> json) => ProductModel(
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category:
            categoryValues.map[json["category"]] ?? CategoryEnum.electronics,
        image: json["image"],
      );

  /// Convertir un objeto de tipo [ProductModel] a un json
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse[category],
        "image": image,
        "rating": rating?.toJson(),
      };

  /// Convertir un objeto de tipo [ProductModel] a un json para agregar un producto
  Map<String, dynamic> toAddJson() => {
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse[category],
        "image": image,
      };
}
