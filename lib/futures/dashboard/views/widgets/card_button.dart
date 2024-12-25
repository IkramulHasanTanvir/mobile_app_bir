import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class CardButton extends StatelessWidget {
  const CardButton(
      {super.key,
      required this.title,
      this.isRedColor = false,
      required this.onTap});

  final String title;
  final bool isRedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.035,
        width: size.width * 0.240,
        decoration: BoxDecoration(
          color: isRedColor ? primaryColor : borderColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
              textStyle:
                  TextStyle(color: isRedColor ? Colors.white : Colors.black,
                  fontSize: size.height * 0.014)),
        ),
      ),
    );
  }
}
