import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/futures/dashboard/models/category.dart';
import 'package:mobile_app_bir/futures/products/views/categories_product.dart';

class CategoriesBox extends StatelessWidget {
  const CategoriesBox({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        //Get.find<NavController>().moveProductScreen(category.id!);
        Get.to(CategoriesProducts(categoryId: category.id!));
      },
      child: Column(
        children: [
          Image.asset(
            category.categoryImg ?? 'Empty',
            height: size.height * 0.070,
            width: size.width * 0.254,
          ),
          Text(
            category.categoryName ?? '',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
              fontSize: size.height * 0.014,
              fontWeight: FontWeight.w400,
            )),
          )
        ],
      ),
    );
  }
}
