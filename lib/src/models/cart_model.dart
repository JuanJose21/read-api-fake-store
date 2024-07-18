import 'dart:convert';

import 'package:read_api_fake_store/src/models/product_cart_model.dart';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  int id;
  int userId;
  DateTime date;
  List<ProductCartModel> products;
  int v;

  /// Convertir un json a un objeto de tipo CartModel
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<ProductCartModel>.from(
            json["products"].map((x) => ProductCartModel.fromJson(x))),
        v: json["__v"],
      );

  /// Convertir un objeto de tipo CartModel a un json
  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "__v": v,
      };
}
