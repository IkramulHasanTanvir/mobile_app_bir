import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, this.viewAllShow = true});

  final String title;
  final bool viewAllShow;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              textStyle:  TextStyle(
                  fontSize: size.height * 0.020, fontWeight: FontWeight.w600)),
        ),
        if(viewAllShow)
        Text(
          'View All',
          style: GoogleFonts.poppins(
              textStyle:  TextStyle(
                  color: viewAllColor,
                  fontWeight: FontWeight.w500,
                fontSize: size.height * 0.014
              )),
        ),
      ],
    );
  }
}
