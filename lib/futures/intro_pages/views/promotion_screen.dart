import 'package:flutter/material.dart';
import 'package:mobile_app_bir/app/utils/assets_path.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/common/widgets/custom_button.dart';
import 'package:mobile_app_bir/futures/intro_pages/models/promotion_model.dart';
import 'package:mobile_app_bir/futures/intro_pages/views/widgets/promotion_card.dart';
import 'package:mobile_app_bir/routes/route_name.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsPath.appLogo,
                          height: size.height * 0.03),
                      CustomButton(
                        isSkip: true,
                        onPressed: () {
                          CustomNavigator.pushAndRemoveAll(
                              RouteName.loginScreen);
                        },
                        label: 'Skip',
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.05),
                  SizedBox(
                    height: size.height * 0.480,
                    child: PageView.builder(
                      itemCount: promotions.length,
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return PromotionCard(
                          title: promotions[index].title,
                          subtitle: promotions[index].subtitle,
                          image: promotions[index].imageUrl,
                          titleName: promotions[index].titleName,
                        );
                      },
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: promotions.length,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 4,
                      activeDotColor: primaryColor,
                      dotColor: dotColor,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _onTapMoveNext,
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapMoveNext() {
    if (_pageController.page == promotions.length - 1) {
      CustomNavigator.pushAndRemoveAll(RouteName.loginScreen);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
