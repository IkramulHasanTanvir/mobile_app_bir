import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class TransactionButton extends StatelessWidget {
  const TransactionButton(
      {super.key,
      required this.onTap,
      required this.label,
      required this.color});

  final VoidCallback onTap;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
            height: 24, child: VerticalDivider(color: reportCardColor)),
        const SizedBox(width: 8),
        MaterialButton(
          onPressed: onTap,
          elevation: 0,
          color: color,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          child: Text(label, style: GoogleFonts.roboto()),
        ),
      ],
    );
  }
}
