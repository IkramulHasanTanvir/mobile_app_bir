import 'package:get/get.dart';
import 'package:mobile_app_bir/futures/dashboard/controller/dashboard_controller.dart';
import 'package:mobile_app_bir/futures/navigation/controller/nav_controller.dart';
import 'package:mobile_app_bir/futures/product_details/controller/product_details_image_controller.dart';
import 'package:mobile_app_bir/futures/product_details/controller/remark_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavController());
    Get.put(DashboardController());
    Get.put(RemarkController());
    Get.put(ProductDetailsImageController());
  }
}
