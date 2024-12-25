import 'package:flutter/material.dart';
import 'package:mobile_app_bir/app/utils/assets_path.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(AssetsPath.appLogo, height: 28),
        ],
      ),
    );
  }
}
