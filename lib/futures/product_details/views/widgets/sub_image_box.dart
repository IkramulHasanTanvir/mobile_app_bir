import 'package:flutter/material.dart';
import 'package:mobile_app_bir/common/widgets/card_image.dart';

class SubImageBox extends StatelessWidget {
  const SubImageBox({
    super.key,
    required this.pageController,
    required this.id,
    required this.image,
  });

  final PageController pageController;
  final int id;
  final String image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:  size.width * 0.016,vertical: size.height * 0.008),
      child: GestureDetector(
        onTap: () {
          pageController.animateToPage(
            id,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: SizedBox(
          height: size.height * 0.074,
          width: size.width * 0.195,
          child: CardImage(
            image: image,
          ),
        ),
      ),
    );
  }
}
