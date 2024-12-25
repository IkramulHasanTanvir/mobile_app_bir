import 'package:get/get.dart';
import 'package:mobile_app_bir/futures/products/models/product.dart';

class DashboardController extends GetxController{
  int _visibleProductCount = 3;

  int get visibleProductCount => _visibleProductCount;

  void loadProduct(){
    if (_visibleProductCount + 3 <=
        productList.length) {
      _visibleProductCount += 3;
    } else {
      _visibleProductCount = productList.length;
    }
    update();
  }
}