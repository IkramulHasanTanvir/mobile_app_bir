import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.label,
      this.icon,
      this.isSkip = false,
      this.color,
      this.foregroundColor});

  final VoidCallback onPressed;
  final String label;
  final Icon? icon;
  final bool isSkip;
  final Color? color;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          foregroundColor: foregroundColor ?? Colors.black,
          backgroundColor: color ?? Colors.white,
          side: const BorderSide(color: borderColor, width: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          fixedSize: isSkip
              ? Size(size.width * 0.2, size.height * 0.040)
              : Size(size.width * 0.370, size.height * 0.040),
        ),
        onPressed: onPressed,
        icon: isSkip ? null : icon,
        label: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: size.height * 0.015,
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}
