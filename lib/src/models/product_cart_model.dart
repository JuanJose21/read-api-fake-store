class ProductCartModel {
  ProductCartModel({
    required this.productId,
    required this.quantity,
  });

  int productId;
  int quantity;

  factory ProductCartModel.fromJson(Map<String, dynamic> json) =>
      ProductCartModel(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
