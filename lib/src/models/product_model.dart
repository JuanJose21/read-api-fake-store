import 'dart:convert';

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
  Rating? rating;

  /// Convertir un json a un objeto de tipo [ProductModel]
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category:
            categoryValues.map[json["category"]] ?? CategoryEnum.electronics,
        image: json["image"],
        rating: json["rating"] != null ? Rating.fromJson(json["rating"]) : null,
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

enum CategoryEnum {
  electronics,
  jewelery,
  mensClothing,
  womensClothing,
}

final categoryValues = EnumValues({
  "electronics": CategoryEnum.electronics,
  "jewelery": CategoryEnum.jewelery,
  "men's clothing": CategoryEnum.mensClothing,
  "women's clothing": CategoryEnum.womensClothing
});

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
