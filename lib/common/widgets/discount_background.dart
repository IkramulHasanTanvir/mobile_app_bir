import 'package:flutter/material.dart';
import 'package:mobile_app_bir/app/utils/assets_path.dart';

class DiscountBackground extends StatelessWidget {
  const DiscountBackground({
    super.key,
    required this.child,
    this.isBig = true,
  });

  final Widget child;
  final bool isBig;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      alignment: Alignment.center,
      height: isBig ? size.height * 0.4 : size.height * 0.2,
      width: size.height < 700 ? size.width * 0.6 : size.width * 0.78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFBA422E),
            Color(0xFFED7561),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: isBig
                ? Image.asset(AssetsPath.discountBigBG)
                : Image.asset(AssetsPath.discountSmallBG),
          ),
          child,
        ],
      ),
    );
  }
}
