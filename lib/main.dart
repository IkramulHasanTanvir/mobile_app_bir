import 'package:flutter/material.dart';
import 'package:mobile_app_bir/app/app.dart';
import 'package:no_screenshot/no_screenshot.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();


  NoScreenshot.instance.screenshotOff();
  runApp(const BirGroupHoldings());
}
