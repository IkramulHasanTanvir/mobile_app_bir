import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/app_controller/binding.dart';
import 'package:mobile_app_bir/app/theme/theme_data.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/localization/language.dart';
import 'package:mobile_app_bir/routes/route_page.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

class BirGroupHoldings extends StatefulWidget {
  const BirGroupHoldings({super.key});

  @override
  State<BirGroupHoldings> createState() => _BirGroupHoldingsState();
}

class _BirGroupHoldingsState extends State<BirGroupHoldings> {
  Locale? _locale;
  @override
  void initState() {
    super.initState();
    _loadLocale();
    NoScreenshot.instance.screenshotOff();
  }


  Future<void> _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('languageCode');
    String? countryCode = prefs.getString('countryCode');

    setState(() {
      _locale = (languageCode != null && countryCode != null)
          ? Locale(languageCode, countryCode)
          : const Locale("bn", "BD");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return const Center(child: CircularProgressIndicator());
    }


    return GetMaterialApp(
      translations: Language(),
      locale: _locale,
      fallbackLocale: const Locale("bn", "BD"),
      initialBinding: Binding(),
      navigatorKey: CustomNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePage.initialRoute,
      routes: RoutePage.routes,
      theme: themeData(context),
    );
  }
}