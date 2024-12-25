import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/common/widgets/card_image.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/futures/navigation/controller/nav_controller.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_scaffold.dart';
import 'package:mobile_app_bir/futures/product_details/views/widgets/button_tile.dart';
import 'package:mobile_app_bir/futures/product_details/views/widgets/product_details_view.dart';
import 'package:mobile_app_bir/futures/product_details/views/widgets/remarks_update_sheet.dart';
import 'package:mobile_app_bir/futures/product_details/views/widgets/sub_image_box.dart';
import 'package:mobile_app_bir/futures/products/models/product.dart';
import 'package:mobile_app_bir/routes/route_name.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key, required this.productId, required this.product,
  });

  final int productId;
  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GetBuilder<NavController>(
      builder: (navController) {
        return CustomScaffold(
          appBar: navController.selectedIndex == 0
              ? CustomAppBar(title: 'Product Details'.tr)
              : null,
          body: navController.selectedIndex == 0
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.024),
                      SizedBox(
                        height: size.height * 0.17,
                        child: PageView.builder(
                          itemCount: widget.product.images.length,
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() => _currentPage = index);
                          },
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.032),
                              child: CardImage(
                                onTapFavourite: (){},
                                isProductDetails: true,
                                image: widget.product.images[index],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),SmoothPageIndicator(
                        controller: _pageController,
                        count: widget.product.images.isNotEmpty ? widget.product.images.length : 1,
                        effect: const ExpandingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 4,
                          activeDotColor: primaryColor,
                          dotColor: dotColor,
                        ),
                      ),
                      SizedBox(height: size.height * 0.012),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.032),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  widget.product.images.length,
                                  (index) {
                                    return SubImageBox(
                                      pageController: _pageController,
                                      id: index,
                                      image: widget.product.images[index],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.016),
                            ProductDetailsView(
                              title: widget.product.title ?? 'No Title',
                              category: 'Category: ${widget.product.category ?? 'Unknown'}',
                              subCategory: 'Sub-Category: ${widget.product.subCategory ?? 'Unknown'}',
                              details: widget.product.description ?? 'No details available.',
                              reviews: widget.product.reviews?.toString() ?? '0',
                              reviewsPoint: widget.product.reviewsPoint?.toString() ?? '0.0',
                              stock: widget.product.stock ?? false,
                              onTap: () {
                                CustomNavigator.pushNamed(RouteName.cartScreen);
                              },
                            ),
                            SizedBox(height: size.height * 0.016),
                            Divider(
                              thickness: 8,
                              color: dividerColors.withOpacity(0.1),
                            ),
                            ButtonTile(
                              type: "Refer",
                              title: 'Refer Product',
                              icon: Icons.share,
                              onTap: () async {
                                await shareContent();
                              },
                            ),
                            ButtonTile(
                                type: "Remarks",
                                title: 'Remarks',
                                icon: Icons.message,
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        const RemarksUpdateSheet(),
                                  );
                                }),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.4),
                    ],
                  ),
                )
              : screenList[navController.selectedIndex],
          bottomNavigationBar: CustomBottomNavBar(
            onDestinationSelected: navController.changePage,
            selectedIndex: navController.selectedIndex,
          ),
        );
      }
    );
  }

  Future<void> shareContent() async {
    try {
      await Share.share(
        'https://www.facebook.com/',
      );
    } catch (e) {
      debugPrint('Error sharing: $e');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
