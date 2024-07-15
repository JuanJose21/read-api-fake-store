import 'dart:convert';

import 'package:read_api_fake_store/src/models/product_model.dart';
import 'package:read_api_fake_store/src/services/carts_service.dart';
import 'package:read_api_fake_store/src/services/products_service.dart';

void getProductsData() async {
  ProductsHttpService productsHttpService = ProductsHttpService();
  final products = await productsHttpService.getProducts();

  products.fold(
    (error) {
      print("Ha ocurrido un error: $error");
    },
    (productsResult) {
      print("------------ Products ------------");
      for (final element in productsResult) {
        print("**************************");
        print("Título: ${element.title}");
        print("Descripción: ${element.description}");
        print("Precio: ${element.price}");
        print("**************************\n");
      }
    },
  );
}

void getCartsData() async {
  CartsHttpService cartsHttpService = CartsHttpService();
  final carts = await cartsHttpService.getCarts();

  carts.fold(
    (error) {
      print("Ha ocurrido un error: $error");
    },
    (cartsResult) {
      print("------------ Carts ------------");
      for (final element in cartsResult) {
        print(jsonEncode(element));
      }
    },
  );
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
  final product = await productsHttpService.addProduct(productModel);

  product.fold(
    (error) {
      print("Ha ocurrido un error: $error");
    },
    (productResult) {
      print("------------ Add product ------------");
      print(jsonEncode(productResult));
    },
  );
}
