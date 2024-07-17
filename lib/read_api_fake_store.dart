import 'dart:convert';

import 'package:read_api_fake_store/src/models/product_model.dart';
import 'package:read_api_fake_store/src/services/carts_service.dart';
import 'package:read_api_fake_store/src/services/products_service.dart';

/// Obtiene y muestra los datos de los productos desde el servicio de productos.
void getProductsData() async {
  ProductsHttpService productsHttpService = ProductsHttpService();
  final products = await productsHttpService.getProducts();

  products.fold(
    (error) {
      print("Ha ocurrido un error: $error");
    },
    (productsResult) {
      // Si la llamada es exitosa, se imprimen los detalles de cada producto.
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

/// Obtiene y muestra los datos de los carritos desde el servicio de carritos.
void getCartsData() async {
  CartsHttpService cartsHttpService = CartsHttpService();
  final carts = await cartsHttpService.getCarts();

  carts.fold(
    (error) {
      print("Ha ocurrido un error: $error");
    },
    (cartsResult) {
      // Si la llamada es exitosa, se imprimen los detalles de cada carrito en formato JSON.
      print("------------ Carts ------------");
      for (final element in cartsResult) {
        print(jsonEncode(element));
      }
    },
  );
}

/// Agrega un producto usando el servicio de productos y muestra el resultado.
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
      // Si la llamada es exitosa, se imprime el detalle del producto agregado en formato JSON.
      print("------------ Add product ------------");
      print(jsonEncode(productResult));
    },
  );
}
