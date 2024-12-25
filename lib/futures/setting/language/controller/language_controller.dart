import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LanguageController {
  List<Map<String, dynamic>> settingsItems = [
    {"logo": Icons.language, "label": "English", "checked": false},
    {"logo": Icons.language, "label": "বাংলা", "checked": false},
  ];

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasAnyPreference = false;

    for (var item in settingsItems) {
      bool? checked = prefs.getBool(item['label']);
      item['checked'] = checked ?? false;
      if (checked == true) hasAnyPreference = true;
    }

    if (!hasAnyPreference) {
      for (var item in settingsItems) {
        if (item['label'] == "বাংলা") {
          item['checked'] = true;
          await prefs.setBool(item['label'], true);
          await prefs.setString('languageCode', 'bn');
          await prefs.setString('countryCode', 'BD');
        }
      }
    }

    final languageCode = prefs.getString('languageCode');
    final countryCode = prefs.getString('countryCode');
    if (languageCode != null && countryCode != null) {
      Get.updateLocale(Locale(languageCode, countryCode));
    }
  }

  Future<void> updateSettings(String label, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(label, value);

    final languageMap = {
      "বাংলা": {"languageCode": 'bn', "countryCode": 'BD'},
      "English": {"languageCode": 'en', "countryCode": 'US'}
    };

    final selectedLanguage = languageMap[label];
    if (selectedLanguage != null) {
      await prefs.setString('languageCode', selectedLanguage['languageCode']!);
      await prefs.setString('countryCode', selectedLanguage['countryCode']!);
    }

    for (var item in settingsItems) {
      item["checked"] = item['label'] == label;
      if (item['label'] != label) await prefs.setBool(item['label'], false);
    }
    if (label == "বাংলা") {
      Get.updateLocale(const Locale("bn", "BD"));
    } else {
      Get.updateLocale(const Locale("en", "US"));
    }
  }

  List<Map<String, dynamic>> getSettings() {
    return settingsItems;
  }
}
