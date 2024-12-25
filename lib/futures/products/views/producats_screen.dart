import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/common/widgets/product_card.dart';
import 'package:mobile_app_bir/futures/dashboard/models/category.dart';
import 'package:mobile_app_bir/futures/dashboard/views/widgets/categories_box.dart';
import 'package:mobile_app_bir/futures/home_pages/views/widgets/section_title.dart';
import 'package:mobile_app_bir/futures/products/models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key,   this.categoryId});

  final int? categoryId;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Products'.tr,
        backButtonShow: false,
      ),
      body: SingleChildScrollView(
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
                      .map((category) => CategoriesBox(
                            category: category,
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 24),
              Column(
                    children: productList.map((product) {
                      return ProductCard(product: product,
                      );
                    }).toList(),
                  ),
              SizedBox(height: size.height * 0.1)
            ],
          ),
        ),
      ),
    );
  }
}
