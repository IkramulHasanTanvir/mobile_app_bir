import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/assets_path.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class LogoAndTitle extends StatelessWidget {
  const LogoAndTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.isSetting = false,
  });

  final String title;
  final String subtitle;
  final bool isSetting;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isSetting == false)
          Center(
            child: Image.asset(
              AssetsPath.appLogo,
              height: size.height * 0.04,
            ),
          ),
        SizedBox(height: size.height * 0.03),
        Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: size.height * 0.03,
            ),
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: size.height * 0.014,
              color: authSubtitleColor,
            ),
          ),
        ),
      ],
    );
  }
}
