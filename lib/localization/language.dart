import 'package:get/get.dart';
import 'package:mobile_app_bir/localization/bn_bd.dart';
import 'package:mobile_app_bir/localization/en_us.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'bn_BD': bnBD,
      };
}
