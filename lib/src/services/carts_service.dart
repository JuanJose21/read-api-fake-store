import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:read_api_fake_store/src/global/global.dart';
import 'package:read_api_fake_store/src/models/cart_model.dart';
import 'package:read_api_fake_store/src/utils/const_app.dart';

class CartsHttpService {
  Future<Either<String, List<CartModel>>> getCarts() async {
    try {
      final uri = Uri.parse(baseUrl + endPointCarts);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<CartModel> carts = cartModelFromJson(response.body);
        return Right(carts);
      } else {
        return Left("Error!!! ${response.statusCode}");
      }
    } catch (e) {
      return Left('Exception - getCarts: $e');
    }
  }
}
