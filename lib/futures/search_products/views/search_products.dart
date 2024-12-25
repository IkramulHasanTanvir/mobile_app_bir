import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/assets_path.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_scaffold.dart';
import 'package:mobile_app_bir/futures/search_products/views/widgets/search_items.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class SearchProducts extends StatefulWidget {
  const SearchProducts({super.key});

  @override
  State<SearchProducts> createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProducts> {
  int curvedNavigationBarIndex = 0;
  String searchQuery = '';

  final List<Map<String, String>> products = [
    {
      'title': 'Michel Tires',
      'description': 'Lorem ipsum dolor sit...',
      'stock': 'Available',
      'image': AssetsPath.tires,
    },
    {
      'title': 'Premium Tires',
      'description': 'Lorem ipsum dolor sit...',
      'stock': 'Out of Stock',
      'image': AssetsPath.tires,
    },
    {
      'title': 'Budget Tires',
      'description': 'Lorem ipsum dolor sit...',
      'stock': 'Available',
      'image': AssetsPath.tires,
    },
  ];

  List<Map<String, String>> get filteredProducts {
    if (searchQuery.isEmpty) {
      return [];
    }
    return products
        .where((product) =>
            product['title']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  void _onDestinationSelected(int index) {
    if (curvedNavigationBarIndex != index) {
      setState(() {
        curvedNavigationBarIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CustomScaffold(
      appBar: curvedNavigationBarIndex == 0
          ? CustomAppBar(title: 'Search Products'.tr, isSearchScreen: false)
          : null,
      body: curvedNavigationBarIndex == 0
          ? Padding(
              padding:
                   EdgeInsets.symmetric(horizontal: size.width * 0.048, vertical: size.height * 0.032),
              child: Column(
                children: [
                  Center(child: Image.asset(AssetsPath.appLogo, height: 22)),
                   SizedBox(height: size.height * 0.016),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Products',
                    ),
                  ),
                  SizedBox(height: size.height * 0.016),
                  Expanded(
                    child: filteredProducts.isEmpty
                        ? const Center(
                            child: Text(
                              'No products found',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product = filteredProducts[index];
                              return SearchItems(
                                image: product['image']!,
                                title: product['title']!,
                                description: product['description']!,
                                stock: product['stock']!, onTap: () {
                                  CustomNavigator.pushNamed(RouteName.productDetailsScreen);
                              },
                              );
                            },
                          ),
                  ),
                ],
              ),
            )
          : screenList[curvedNavigationBarIndex],
      bottomNavigationBar: CustomBottomNavBar(
        onDestinationSelected: _onDestinationSelected,
        selectedIndex: curvedNavigationBarIndex,
      ),
    );
  }
}
