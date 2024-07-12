import 'dart:convert';

import 'package:read_api_fake_store/src/models/cart_model.dart';
import 'package:read_api_fake_store/src/models/product_model.dart';
import 'package:read_api_fake_store/src/services/carts_service.dart';
import 'package:read_api_fake_store/src/services/products_service.dart';

void getProductsData() async {
  List<ProductModel> productModel = [];

  ProductsHttpService productsHttpService = ProductsHttpService();
  productModel = await productsHttpService.getProducts();

  print("------------ Products ------------");

  for (var element in productModel) {
    print(jsonEncode(element));
  }
}

void getCartsData() async {
  List<CartModel> cartModel = [];

  CartsHttpService cartsHttpService = CartsHttpService();
  cartModel = await cartsHttpService.getCarts();

  print("------------ Carts ------------");

  for (var element in cartModel) {
    print(jsonEncode(element));
  }
}
