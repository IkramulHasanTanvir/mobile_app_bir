import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/card_image.dart';
import 'package:mobile_app_bir/futures/dashboard/views/widgets/card_button.dart';
import 'package:mobile_app_bir/futures/product_details/views/product_details_screen.dart';
import 'package:mobile_app_bir/futures/products/models/product.dart';

class MostPopularCard extends StatelessWidget {
  const MostPopularCard({
    super.key,
    required this.product, required this.index,
  });

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.only(
        left: size.width * 0.032,
        right: productList.length - 1 == index ? size.width * 0.032 : 0,
      ),
      height: size.height * 0.270,
      width: size.width * 0.450,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.020, vertical: size.height * 0.010),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.1,
              child: CardImage(
                //discount: mostPopularModel.discount,
                image: product.images.first,
              ),
            ),
            SizedBox(height: size.height * 0.004),
            Text(
              product.title ?? '',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.height * 0.016)),
            ),
            SizedBox(height: size.height * 0.004),
            Text(product.description ?? '',
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: size.height * 0.013,
                        color: cardSubtitleColor))),
            SizedBox(height: size.height * 0.004),
            RichText(
              text: TextSpan(
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black, fontSize: size.height * 0.016)),
                  text: 'Stock: ',
                  children: [
                    TextSpan(
                        style: TextStyle(
                            color:
                                product.stock! ? Colors.green : primaryColor),
                        text: product.stock! ? 'Available' : 'Out of Stock'),
                  ]),
            ),
            SizedBox(height: size.height * 0.014),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CardButton(
                    title: 'Details',
                    onTap: () {
                      if (product.id != null) {
                        Get.to(ProductDetailsScreen(productId: product.id!, product: product,));
                      } else {
                        debugPrint('Product ID is null');
                      }                    },
                  ),
                ),
                SizedBox(width: size.width * 0.08),
                Expanded(
                  child: CardButton(
                    title: 'Add',
                    isRedColor: true,
                    onTap: () {
                      // TODO:
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
