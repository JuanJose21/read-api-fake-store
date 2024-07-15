import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:read_api_fake_store/src/global/global.dart';
import 'package:read_api_fake_store/src/models/product_model.dart';
import 'package:read_api_fake_store/src/utils/const_app.dart';

class ProductsHttpService {
  Future<List<ProductModel>> getProducts() async {
    final uri = Uri.parse(baseUrl + endPointProducts);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return productsModelFromJson(response.body);
    } else {
      throw ("Error!!! ${response.statusCode}");
    }
  }

  Future<ProductModel> addProduct(ProductModel product) async {
    final uri = Uri.parse(baseUrl + endPointProducts);
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product),
    );

    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw ("Error!!! ${response.statusCode}");
    }
  }
}
