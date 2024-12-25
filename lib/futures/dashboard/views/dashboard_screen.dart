import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/common/widgets/product_card.dart';
import 'package:mobile_app_bir/common/widgets/small_promotion_card.dart';
import 'package:mobile_app_bir/futures/dashboard/controller/dashboard_controller.dart';
import 'package:mobile_app_bir/futures/dashboard/models/category.dart';
import 'package:mobile_app_bir/futures/dashboard/views/widgets/categories_box.dart';
import 'package:mobile_app_bir/futures/dashboard/views/widgets/most_popular_card.dart';
import 'package:mobile_app_bir/futures/home_pages/models/banner_model.dart';
import 'package:mobile_app_bir/futures/home_pages/views/widgets/banner_top_section.dart';
import 'package:mobile_app_bir/futures/home_pages/views/widgets/section_title.dart';
import 'package:mobile_app_bir/futures/products/models/product.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'Dashboard'.tr, backButtonShow: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BannerTopSection(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.height * 0.016),
                  child: RichText(
                    text: TextSpan(
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: size.height * 0.016,
                          color: companyColors,
                        )),
                        text: 'Company : '.tr,
                        children: const [TextSpan(text: 'KPMS')]),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.height * 0.016),
                  child: const Divider(color: dividerColors),
                ),
                SizedBox(height: size.height * 0.008),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.height * 0.016),
                  child: const SectionTitle(title: 'Categories'),
                ),
                SizedBox(height: size.height * 0.008),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categoriesList
                        .map(
                          (category) => CategoriesBox(category: category),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: size.height * 0.024),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.height * 0.016),
                  child: const SectionTitle(title: 'Most Popular'),
                ),
                SizedBox(height: size.height * 0.008),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(productList.length, (index) {
                    return MostPopularCard(
                      product: productList[index],
                      index: index,
                    );
                  })),
                ),
                SizedBox(height: size.height * 0.016),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.height * 0.016),
                  child: const SectionTitle(
                      title: 'Top Sales', viewAllShow: false),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.height * 0.016),
                  child: GetBuilder<DashboardController>(
                      builder: (dashboardController) {
                    return Column(
                      children: List.generate(
                          dashboardController.visibleProductCount, (index) {
                        return ProductCard(
                          product: productList[index],
                        );
                      }),
                    );
                  }),
                ),
                Center(child: GetBuilder<DashboardController>(
                    builder: (dashboardController) {
                  return TextButton(
                      onPressed: dashboardController.loadProduct,
                      child: Text(
                        'Load More'.tr,
                        style: GoogleFonts.poppins(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.w500)),
                      ));
                })),
              ],
            ),
            SizedBox(
              height: size.height * 0.18,
              width: double.infinity,
              child: SmallPromotionCard(
                title: banners.first.title,
                subtitle: banners.first.subtitle,
                image: banners.first.imageUrl,
              ),
            ),
            SizedBox(height: size.height * 0.14),
          ],
        ),
      ),
    );
  }
}
