import 'package:get/get.dart';

class ProductDetailsImageController extends GetxController {
  int _currentPage = 0;

  void changePage(index) {
    _currentPage = index;
    update();
  }
}
