import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/common/widgets/discount_background.dart';

class SmallPromotionCard extends StatelessWidget {
  const SmallPromotionCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.016),
      child: DiscountBackground(
          isBig: false,
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.016),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.38,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: size.height * 0.02,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(right: size.height * 0.04),
                        child: Text(subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: size.height * 0.012,
                                color: Colors.white,
                              ),
                            )),
                      ),
                      SizedBox(height: size.height * 0.012),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.height * 0.024,
                          vertical: size.height * 0.004,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black.withOpacity(0.4),
                        ),
                        child: Text(
                          'Learn More',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset(
                  image,
                  height: size.height * 0.12,
                  width: size.width * 0.3,
                )
              ],
            ),
          )),
    );
  }
}
