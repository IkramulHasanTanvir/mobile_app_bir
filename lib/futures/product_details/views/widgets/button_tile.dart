import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class ButtonTile extends StatelessWidget {
  const ButtonTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  final String title;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      title: Text(title.tr),
      leading: Icon(icon),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 18,
        color: authSubtitleColor,
      ),
    );
  }
}
