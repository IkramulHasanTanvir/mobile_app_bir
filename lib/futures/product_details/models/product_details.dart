/*
import 'package:assessment/app/utils/assets_path.dart';
import 'package:assessment/futures/dashboard/models/category.dart';
import 'package:assessment/futures/products/models/product.dart';

class ProductsDetails {
  int? id;
  String? imgOne;
  String? imgTwo;
  String? imgThree;
  String? imgThreeD;
  String? category;
  String? subCategory;
  String? reviews;
  String? reviewsPoint;
  int productId;
  Product? product;

  ProductsDetails(
      { this.id,
      this.imgOne,
      this.imgTwo,
      this.imgThree,
      this.imgThreeD,
      this.category,
      this.subCategory,
      this.reviews,
      this.reviewsPoint,
      required this.productId,
      this.product});

  List<String> get images {
    return [imgOne, imgTwo, imgThree, imgThreeD].whereType<String>().toList();
  }

  String get stockStatus => product?.stock == true ? 'Available' : 'Out of Stock';
}

final List<ProductsDetails> productsDetailsList = [
  ProductsDetails(
    id: 1,
    imgOne: AssetsPath.tires,
    imgTwo: AssetsPath.tires,
    imgThree: AssetsPath.tires,
    imgThreeD: AssetsPath.threeDOBJ,
    category: 'Parts',
    subCategory: 'Tires',
    reviews: '230',
    productId: 1,
    product: Product(
      id: 1,
      title: "Michel Tires",
      description: "High-quality tires for all terrains.",
      discount: 10,
      image: AssetsPath.tires,
      stock: true,
      categoryId: 1,
      category: Category(id: 1),
    ),
  ),
];
*/
