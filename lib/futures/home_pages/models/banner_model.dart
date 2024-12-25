import 'package:mobile_app_bir/app/utils/assets_path.dart';

class BannerModel {
  final String title, subtitle, imageUrl;

  BannerModel({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

List<BannerModel> banners = [
  BannerModel(
    imageUrl: AssetsPath.tires,
    title: '20% Discount on All Tires',
    subtitle: 'Avail this discount by 23rd June',
  ),
  BannerModel(
    imageUrl: AssetsPath.hiclipart1,
    title: '20% Discount on All Tires',
    subtitle: 'Avail this discount by 23rd June',
  ),
  BannerModel(
    imageUrl: AssetsPath.hiclipart,
    title: '20% Discount on All Tires',
    subtitle: 'Avail this discount by 23rd June',
  ),
  BannerModel(
    imageUrl: AssetsPath.tires,
    title: '20% Discount on All Tires',
    subtitle: 'Avail this discount by 23rd June',
  ),
];
