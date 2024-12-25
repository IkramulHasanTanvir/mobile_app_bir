import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/futures/navigation/controller/nav_controller.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_scaffold.dart';

class BottomNavSection extends StatefulWidget {
  const BottomNavSection({super.key});

  @override
  State<BottomNavSection> createState() => _BottomNavSectionState();
}

class _BottomNavSectionState extends State<BottomNavSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(builder: (navController) {
      return CustomScaffold(
        body: screenList[navController.selectedIndex],
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: navController.selectedIndex,
          onDestinationSelected: navController.changePage,
        ),
      );
    });
  }
}
