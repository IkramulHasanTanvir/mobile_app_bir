import 'package:flutter/cupertino.dart';
import 'package:mobile_app_bir/futures/Report/report_screen.dart';
import 'package:mobile_app_bir/futures/dashboard/views/dashboard_screen.dart';
import 'package:mobile_app_bir/futures/products/views/producats_screen.dart';
import 'package:mobile_app_bir/futures/setting/settings_screen.dart';
import 'package:mobile_app_bir/futures/transactions/views/transactions_date.dart';

const Color borderColor = Color(0xFFBEC2C7);
const Color dotColor = Color(0xFFD9D9D9);
const Color authSubtitleColor = Color(0xFF8F949A);
const Color checkboxColor = Color(0xFFE9533A);
const Color dividerColors = Color(0xFFDEDEDE);
const Color dividerTextColors = Color(0xFF8F949A);
const Color pinFieldColors = Color(0xFFBEC2C7);
const Color checkMarkColors = Color(0xFF38AF6D);
const Color companyColors = Color(0xFF9D9D9D);
const Color lockColor = Color(0xFFF08775);
const Color cardColor = Color(0xFFFFD9D9);
const Color allCardColor = Color(0xFFFBDDD8);
const Color viewAllColor = Color(0xFFFF804D);
const Color navIndicatorColor = Color(0xFFA30000);
const Color cardSubtitleColor = Color(0xFF595C5F);
const Color statusColors = Color(0xFFF8E794);
const Color successColor = Color(0xFF119548);
const Color wongColor = Color(0xFFFFC107);
const Color reportCardColor = Color(0xFFFFD9D9);

const Color primaryColor = Color(0xFFCC0000);

const LinearGradient customLinearGradient = LinearGradient(
  colors: [
    Color(0xFFA33A29),
    Color(0xFFED7561),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);


const List<Widget> screenList = [
  DashboardScreen(),
  ProductsScreen(),
  TransactionsDate(),
  ReportScreen(),
  SettingsScreen(),
];
