
import 'package:mobile_app_bir/app/utils/assets_path.dart';

class Category {
  int? id;
  String? categoryName;
  String? categoryImg;

  Category({
    this.id,
    this.categoryName,
    this.categoryImg,
  });
}

List<Category> categoriesList = [
  Category(
    id: 1,
    categoryName: 'Tires',
    categoryImg: AssetsPath.tires,
  ),
  Category(
    id: 2,
    categoryName: 'Battery',
    categoryImg: AssetsPath.battary,
  ),
  Category(
    id: 3,
    categoryName: 'Spark Plug',
    categoryImg: AssetsPath.hiclipart,
  ),
  Category(
    id: 4,
    categoryName: 'Suspension',
    categoryImg: AssetsPath.hiclipart1,
  ),
];
