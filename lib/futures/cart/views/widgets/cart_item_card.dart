import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/assets_path.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/card_image.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.qty,
    required this.title,
    required this.subtitle,
    this.onTapRemove,
    this.onTapAdd,
  });

  final int qty;
  final String title;
  final String subtitle;
  final VoidCallback? onTapRemove;
  final VoidCallback? onTapAdd;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: onTapAdd != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: size.height * 0.065,
                  width: size.width * 0.130,
                  child: const CardImage(image: AssetsPath.tires),
                ),
                SizedBox(width: size.width * 0.048),
                Padding(
                  padding: EdgeInsets.only(left: onTapAdd != null ? 0 : size.width * 0.016),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.016)),
                      ),
                      Text(
                        'Category: $subtitle',
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: size.height * 0.014,
                                color: cardSubtitleColor)),
                      ),
                      Text(
                        onTapRemove == null || onTapAdd == null ? 'Qty: $qty' : '',
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: size.height * 0.014,
                                color: cardSubtitleColor)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (onTapAdd != null || onTapRemove != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.delete,
                      size: 18,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: size.height * 0.010),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.024,
                        vertical: size.height * 0.006),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: onTapRemove,
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: size.width * 0.016),
                        Text(qty.toString(),
                            style:  TextStyle(
                                fontSize: size.height * 0.02,
                                color: Colors.white,
                                fontWeight: FontWeight.w900)),
                        SizedBox(width: size.width * 0.016),
                        InkWell(
                          onTap: onTapAdd,
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
        SizedBox(width: size.height * 0.004),
        Divider(
          thickness: 1,
          color: dividerColors.withOpacity(0.5),
        ),
        SizedBox(width: size.height * 0.008),
      ],
    );
  }
}
