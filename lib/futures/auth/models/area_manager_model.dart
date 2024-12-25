
import 'package:mobile_app_bir/app/utils/assets_path.dart';

class AreaManagerModel {
  final String title, subtitle, imageUlr;
  final String phoneNumber;

  AreaManagerModel({
    required this.phoneNumber,
    required this.title,
    required this.subtitle,
    required this.imageUlr,
  });
}

List<AreaManagerModel> areaManagers = [
  AreaManagerModel(
    title: 'Manager AA',
    subtitle: 'Area: Khilgaon',
    imageUlr: AssetsPath.person1,
    phoneNumber: '+8801819‑959636',
  ),
  AreaManagerModel(
    title: 'Manager BB',
    subtitle: 'Area: Malibagh',
    imageUlr: AssetsPath.person2,
    phoneNumber: '01831266537',
  ),
  AreaManagerModel(
    title: 'Manager CC',
    subtitle: 'Area: Mohakhali',
    imageUlr: AssetsPath.person3,
    phoneNumber: '01763‑686527',
  ),
  AreaManagerModel(
    title: 'Manager DD',
    subtitle: 'Area: Banasree',
    imageUlr: AssetsPath.person4,
    phoneNumber: '+880 1977-554401',
  ),
];
