import 'package:read_api_fake_store/src/utils/enums/enums.dart';

enum CategoryEnum {
  electronics,
  jewelery,
  mensClothing,
  womensClothing,
}

final categoryValues = EnumValues({
  "electronics": CategoryEnum.electronics,
  "jewelery": CategoryEnum.jewelery,
  "men's clothing": CategoryEnum.mensClothing,
  "women's clothing": CategoryEnum.womensClothing
});
