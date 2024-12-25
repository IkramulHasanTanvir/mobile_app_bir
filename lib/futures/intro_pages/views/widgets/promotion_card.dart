import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/common/widgets/discount_background.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.titleName,
  });

  final String title;
  final String subtitle;
  final String image;
  final String titleName;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          DiscountBackground(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.095,
                vertical: size.height * 0.044,
              ),
              child: Column(
                children: [
                  Text(title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: size.height * 0.03,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.032,
                      vertical: size.height * 0.016,
                    ),
                    child: Text(subtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: size.height * 0.02,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Image.asset(
                    image,
                    width: size.width * 0.4,
                    height: size.height * 0.13,
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.02),
            child: Text(
              titleName,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: size.height * 0.018),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
