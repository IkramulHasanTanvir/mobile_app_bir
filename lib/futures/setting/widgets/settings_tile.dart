import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {super.key,
      required this.icon,
      required this.label,
      required this.ontTap});

  final IconData icon;
  final String label;
  final VoidCallback ontTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return ListTile(
      onTap: ontTap,
      leading: Icon(icon),
      title: Text(
        label,
        style: GoogleFonts.poppins(textStyle:  TextStyle(fontSize: size.height * 0.018)),
      ),
      trailing:  Icon(
        Icons.arrow_forward_ios_outlined,
        size: size.height * 0.018,
        color: cardSubtitleColor,
      ),
    );
  }
}
