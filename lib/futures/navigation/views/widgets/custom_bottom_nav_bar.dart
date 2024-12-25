import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(
      {super.key, required this.selectedIndex, this.onDestinationSelected});

  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      onTap: onDestinationSelected,
      backgroundColor: Colors.transparent,
      color: primaryColor,
      height: 60,
      index: selectedIndex,
      items: _buildNavBarItems(),
    );
  }

  List<Widget> _buildNavBarItems() {
    const List<IconData> icons = [
      Icons.space_dashboard,
      Icons.directions_car,
      Icons.receipt_long,
      Icons.analytics,
      Icons.more_vert,
    ];

    const List<String> labels = [
      "Dashboard",
      "Products",
      "Transaction",
      "Reports",
      "More",
    ];

    return List.generate(
      icons.length,
      (index) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icons[index],
            color: Colors.white,
            size: selectedIndex == index ? 40 : 28,
          ),
          if (selectedIndex != index)
            Text(
              labels[index],
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
        ],
      ),
    );
  }
}
