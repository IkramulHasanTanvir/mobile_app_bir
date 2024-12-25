import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.title, required this.formField});

  final String title;
  final TextFormField formField;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              textStyle:  TextStyle(
            fontSize: size.height * 0.014,
            fontWeight: FontWeight.w500,
          )),
        ),
         SizedBox(height: size.height * 0.008),
        formField,
         SizedBox(height: size.height * 0.008),
      ],
    );
  }
}
