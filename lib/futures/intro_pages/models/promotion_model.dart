
import 'package:mobile_app_bir/app/utils/assets_path.dart';

class PromotionModel {
  final String title, subtitle, imageUrl, titleName;

  PromotionModel({
    required this.titleName,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

List<PromotionModel> promotions = [
  PromotionModel(
    titleName: 'Some of Promotional Content as Product wise-001',
    title: '20% Discount on All Tires',
    subtitle: 'Avail this discount by 23rd June',
    imageUrl: AssetsPath.tires,
  ),
  PromotionModel(
    titleName: 'Some of Promotional Content as Product wise-002',
    title: '20% Discount on All Tires',
    subtitle: 'Avail this discount by 23rd June',
    imageUrl: AssetsPath.hiclipart,
  ),
  PromotionModel(
    titleName: 'Some of Promotional Content as Product wise-002',
    title: '20% Discount on All Tires',
    subtitle: 'Avail this discount by 23rd June',
    imageUrl: AssetsPath.hiclipart1,
  ),
  PromotionModel(
    titleName: 'Some of Promotional Content as Product wise-001',
    title: '20% Discount on All Tires',
    subtitle: 'Avail this discount by 23rd June',
    imageUrl: AssetsPath.tires,
  ),
  PromotionModel(
    titleName: 'Some of Promotional Content as Product wise-002',
    title: '20% Discount on All Tires',
    subtitle: 'Avail this discount by 23rd June',
    imageUrl: AssetsPath.hiclipart1,
  ),
];
