import 'package:http/http.dart' as http;
import 'package:read_api_fake_store/src/global/global.dart';
import 'package:read_api_fake_store/src/models/cart_model.dart';
import 'package:read_api_fake_store/src/utils/const_app.dart';

class CartsHttpService {
  Future<List<CartModel>> getCarts() async {
    final uri = Uri.parse(baseUrl + endPointCarts);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return cartModelFromJson(response.body);
    } else {
      throw ("Error!!! ${response.statusCode}");
    }
  }
}
