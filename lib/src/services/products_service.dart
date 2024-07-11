import 'package:http/http.dart' as http;
import 'package:read_api_fake_store/src/global/global.dart';
import 'package:read_api_fake_store/src/models/product_model.dart';
import 'package:read_api_fake_store/src/utils/const_app.dart';

class ProductsHttpService {
  Future<List<ProductModel>> getProducts() async {
    var uri = Uri.parse(baseUrl + endPointProducts);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw ("Error!!! ${response.statusCode}");
    }
  }
}
