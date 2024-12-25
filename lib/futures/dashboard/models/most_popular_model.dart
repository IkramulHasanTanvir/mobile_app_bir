
import 'package:mobile_app_bir/app/utils/assets_path.dart';

class MostPopularModel {
  final String discount;
  final String title;
  final String subtitle;
  final bool stock;
  final String image;

  MostPopularModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.stock,
    required this.discount,
  });
}

List<MostPopularModel> mostPopularModelList = [
  MostPopularModel(
    title: 'Michel Tires',
    image: AssetsPath.tires,
    subtitle: 'Lorem ipsum dolor sit amet consectetur elit',
    stock: true,
    discount: '20',
  ),
  MostPopularModel(
    title: 'Michel Suspension',
    image: AssetsPath.hiclipart,
    subtitle: 'Lorem ipsum dolor sit amet consectetur elit',
    stock: true,
    discount: '',
  ),
];
