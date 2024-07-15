import 'dart:convert';

import 'package:read_api_fake_store/src/models/cart_model.dart';
import 'package:read_api_fake_store/src/models/product_model.dart';
import 'package:read_api_fake_store/src/services/carts_service.dart';
import 'package:read_api_fake_store/src/services/products_service.dart';

void getProductsData() async {
  List<ProductModel> productsResult = [];

  ProductsHttpService productsHttpService = ProductsHttpService();
  productsResult = await productsHttpService.getProducts();

  print("------------ Products ------------");

  for (final element in productsResult) {
    print(jsonEncode(element));
  }
}

void getCartsData() async {
  List<CartModel> cartsResult = [];

  CartsHttpService cartsHttpService = CartsHttpService();
  cartsResult = await cartsHttpService.getCarts();

  print("------------ Carts ------------");

  for (final element in cartsResult) {
    print(jsonEncode(element));
  }
}

void addProduct() async {
  ProductModel productModel = ProductModel.fromJson({
    "title": "Product Testing 1",
    "price": 1,
    "description": "Product Testing 1 Description",
    "category": "electronics",
    "image": "https://i.pravatar.cc/",
  });

  ProductsHttpService productsHttpService = ProductsHttpService();
  ProductModel productResult =
      await productsHttpService.addProduct(productModel);

  print("------------ Add product ------------");

  print(jsonEncode(productResult));
}
