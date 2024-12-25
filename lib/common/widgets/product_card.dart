import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/card_image.dart';
import 'package:mobile_app_bir/futures/dashboard/views/widgets/card_button.dart';
import 'package:mobile_app_bir/futures/product_details/views/product_details_screen.dart';
import 'package:mobile_app_bir/futures/products/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key, required this.product,});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.016),
      child: Container(
        width: size.width,
        height: size.height * 0.135,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.020, vertical: size.height * 0.010),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardImage(
                discount: product.discount ?? 0,
                image: product.images.first,
                onTapFavourite: () {
                  //TODO:
                },
              ),
              SizedBox(width: size.height * 0.016),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? '',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.016)),
                    ),
                    Text(product.description ?? '',
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: size.height * 0.013,
                                color: cardSubtitleColor))),
                    RichText(
                      text: TextSpan(
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.016)),
                          text: 'Stock: ',
                          children: [
                            TextSpan(
                                style: TextStyle(
                                    color: product.stock ?? true
                                        ? Colors.green
                                        : primaryColor),
                                text: product.stock ?? true
                                    ? 'Available'
                                    : 'Out of Stock'),
                          ]),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CardButton(
                              title: 'Details',
                              onTap: (){
                                Get.to(ProductDetailsScreen(productId: product.id!, product: product,));
                              },)),
                        SizedBox(width: size.width * 0.08),
                        Expanded(
                          child: CardButton(
                              title: 'Add',
                              isRedColor: true,
                              onTap: () {
                                //TODO:
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
