
import 'package:mobile_app_bir/app/utils/assets_path.dart';
import 'package:mobile_app_bir/futures/dashboard/models/category.dart';

class Product {
  int? id;
  String? title;
  String? description;
  int? discount;
  //String? image;
  bool? stock;
  int? categoryId;
  Category? category;
  // demo
  String? imgOne;
  String? imgTwo;
  String? imgThree;
  String? imgThreeD;
  String? subCategory;
  String? reviews;
  String? reviewsPoint;

  Product(
      {this.id,
      this.title,
      this.description,
      this.discount,
     // this.image,
      this.stock,
      this.categoryId,
      this.category,
        this.imgOne,
        this.imgTwo,
        this.imgThree,
        this.imgThreeD,
        this.subCategory,
        this.reviews,
        this.reviewsPoint
      });

  List<String> get images {
    return [imgOne, imgTwo, imgThree, imgThreeD].whereType<String>().toList();
  }
}

final List<Product> productList = [
  Product(
    id: 1,
    title: "Michel Tires",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
    discount: 10,
    //image: AssetsPath.tires,
    stock: true,
    categoryId: 1,
    category: Category(id: 1),
    imgOne: AssetsPath.tires,
    imgTwo: AssetsPath.tires,
    imgThree: AssetsPath.tires,
    imgThreeD: AssetsPath.threeDOBJ,
    subCategory: 'Tires',
    reviews: '230',
    reviewsPoint: '3.5'
  ),
  Product(
    id: 2,
    title: "Michel Suspension",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
    discount: 20,
    //image: AssetsPath.hiclipart,
    stock: true,
    categoryId: 1,
    category: Category(id: 1),
      imgOne: AssetsPath.hiclipart1,
      imgTwo: AssetsPath.hiclipart1,
      imgThree: AssetsPath.hiclipart1,
      imgThreeD: AssetsPath.threeDOBJ,
      subCategory: 'Tires',
      reviews: '230',
      reviewsPoint: '3.5'
  ),
  Product(
    id: 3,
    title: "Michel Tires",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
    //discount: 10,
    //image: AssetsPath.tires,
    stock: false,
    categoryId: 1,
    category: Category(id: 1),
      imgOne: AssetsPath.hiclipart,
      imgTwo: AssetsPath.hiclipart,
      imgThree: AssetsPath.hiclipart,
      imgThreeD: AssetsPath.threeDOBJ,
      subCategory: 'Tires',
      reviews: '230',
      reviewsPoint: '3.5'
  ),
  Product(
    id: 4,
    title: "Michel Suspension",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
    discount: 10,
    //image: AssetsPath.tires,
    stock: true,
    categoryId: 1,
    category: Category(id: 1),
      imgOne: AssetsPath.tires,
      imgTwo: AssetsPath.tires,
      imgThree: AssetsPath.tires,
      imgThreeD: AssetsPath.threeDOBJ,
      subCategory: 'Tires',
      reviews: '230',
      reviewsPoint: '3.5'
  ),
];
