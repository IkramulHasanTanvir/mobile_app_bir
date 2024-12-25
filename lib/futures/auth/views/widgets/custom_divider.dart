import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return
      Row(
        children: [
          const Expanded(
              child: Divider(
                color: dividerColors,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  textStyle:  TextStyle(
                    color: dividerTextColors,
                    fontSize: size.height * 0.016,
                  )),
            ),
          ),
          const Expanded(
              child: Divider(
                color: dividerColors,
              )),
        ],
      );
  }
}
