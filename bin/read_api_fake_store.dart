import 'package:read_api_fake_store/read_api_fake_store.dart'
    as read_api_fake_store;
import 'package:read_api_fake_store/src/models/product_model.dart';
import 'package:read_api_fake_store/src/services/products_service.dart';

void main(List<String> arguments) {
  print('Hello world: ${read_api_fake_store.calculate()}!');
  getProductsData();
}

void getProductsData() async {
  List<ProductModel> productModel = [];

  ProductsHttpService productsHttpService = ProductsHttpService();
  productModel = await productsHttpService.getProducts();

  for (var element in productModel) {
    print(element.title);
  }
}
