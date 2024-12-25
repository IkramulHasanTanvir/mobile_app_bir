import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_app_bir/app/utils/assets_path.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/small_promotion_card.dart';
import 'package:mobile_app_bir/futures/home_pages/models/banner_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerTopSection extends StatefulWidget {
  const BannerTopSection({super.key});

  @override
  State<BannerTopSection> createState() => _BannerTopSectionState();
}

class _BannerTopSectionState extends State<BannerTopSection> {
  final PageController _pageController = PageController();
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.044,
            vertical: size.height * 0.024,
          ),
          child: Image.asset(AssetsPath.appLogo, height: size.height * 0.022),
        ),
        SizedBox(
          height: size.height * 0.18,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: banners.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              final banner = banners[index];
              return SmallPromotionCard(
                title: banner.title,
                subtitle: banner.subtitle,
                image: banner.imageUrl,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: SmoothPageIndicator(
            controller: _pageController,
            count: banners.length,
            effect: const ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              spacing: 4,
              activeDotColor: primaryColor,
              dotColor: dotColor,
            ),
          ),
        ),
      ],
    );
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_pageController.hasClients) {
        final nextPage = _currentPage + 1;

        // Smoothly scroll until the last page
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );

        // Check if the next page exceeds the total page count
        if (nextPage >= banners.length - 1) {
          Future.delayed(const Duration(milliseconds: 300), () {
            // Reset to the first page without animation
            _pageController.jumpToPage(0);
            _currentPage = 0;
          });
        } else {
          // Update the current page
          _currentPage = nextPage;
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Stop the timer
    _pageController.dispose();
    super.dispose();
  }
}
