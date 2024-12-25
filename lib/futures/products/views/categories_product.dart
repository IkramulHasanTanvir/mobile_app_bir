import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/common/widgets/product_card.dart';
import 'package:mobile_app_bir/futures/dashboard/models/category.dart';
import 'package:mobile_app_bir/futures/dashboard/views/widgets/categories_box.dart';
import 'package:mobile_app_bir/futures/home_pages/views/widgets/section_title.dart';
import 'package:mobile_app_bir/futures/navigation/controller/nav_controller.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_scaffold.dart';
import 'package:mobile_app_bir/futures/products/models/product.dart';

class CategoriesProducts extends StatefulWidget {
  const CategoriesProducts({super.key, required this.categoryId});

  final int categoryId;

  @override
  State<CategoriesProducts> createState() => _CategoriesProductsState();
}

class _CategoriesProductsState extends State<CategoriesProducts> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GetBuilder<NavController>(builder: (navController) {
      return CustomScaffold(
        appBar: navController.selectedIndex == 0
            ? CustomAppBar(
                title: 'Products'.tr,
                backButtonShow: true,
              )
            : null,
        body: navController.selectedIndex == 0
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const SectionTitle(title: 'Categories'),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categoriesList
                              .map(
                                (category) => CategoriesBox(
                                  category: category,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Column(
                        children: List.generate(productList.length, (index) {
                          return ProductCard(
                            product: productList[index],
                          );
                        }),
                      ),
                      SizedBox(height: size.height * 0.1)
                    ],
                  ),
                ),
              )
            : screenList[navController.selectedIndex],
        bottomNavigationBar: CustomBottomNavBar(
          onDestinationSelected: navController.changePage,
          selectedIndex: navController.selectedIndex,
        ),
      );
    });
  }
}
