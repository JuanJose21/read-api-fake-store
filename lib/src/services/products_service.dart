import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:read_api_fake_store/src/global/global.dart';
import 'package:read_api_fake_store/src/models/product_model.dart';
import 'package:read_api_fake_store/src/utils/const_app.dart';

class ProductsHttpService {
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final uri = Uri.parse(baseUrl + endPointProducts);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<ProductModel> products =
            productsModelFromJson(response.body);
        return Right(products);
      } else {
        return Left('Error: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception - getProducts: $e');
    }
  }

  Future<Either<String, ProductModel>> addProduct(ProductModel product) async {
    try {
      final uri = Uri.parse(baseUrl + endPointProducts);
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(product),
      );

      if (response.statusCode == 200) {
        final ProductModel product = productModelFromJson(response.body);
        return Right(product);
      } else {
        return Left("Error!!! ${response.statusCode}");
      }
    } catch (e) {
      return Left('Exception - addProduct: $e');
    }
  }
}
