import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class CardImage extends StatefulWidget {
  const CardImage({
    super.key,
    this.isProductDetails = false,
    this.onTapFavourite,
    required this.image,
    this.discount,
  });

  final bool isProductDetails;
  final VoidCallback? onTapFavourite;
  final String image;
  final int? discount;

  @override
  State<CardImage> createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: widget.isProductDetails ? primaryColor : cardColor,
              width: 1),
          color: widget.image.endsWith('.obj') ? Colors.white : allCardColor,
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Center(
            child: widget.image.endsWith('.obj')
                ? Flutter3DViewer.obj(
                    cameraX: 0, // Center horizontally
                    cameraY: 0, // Center vertically
                    cameraZ: 7,
                    src: widget.image,
                  )
                : Image.asset(
                    widget.image,
                    height: 90,
                    width: 160,
                  ),
          ),
          if (widget.discount != null && widget.discount != 0)
            Positioned(
              top: 8,
              child: Container(
                alignment: Alignment.center,
                height: 18,
                width: 59,
                decoration: const BoxDecoration(
                    color: checkboxColor,
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(20))),
                child: Text(
                  'Save ${widget.discount}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          if (widget.onTapFavourite != null)
            Positioned(
              right: 5,
              top: 5,
              child: GestureDetector(
                onTap: widget.onTapFavourite,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade600.withOpacity(0.9)),
                  child: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
