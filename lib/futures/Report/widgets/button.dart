import 'package:flutter/material.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class Button extends StatelessWidget {
  final String name, image;
  final VoidCallback onTap;
  const Button({super.key, required this.name, required this.image, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.060,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: lockColor.withOpacity(0.4),
          border: Border.all(color: primaryColor)
        ),
        width: size.width * 0.350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              width: 24,
              height: 24,
            ),
            Text(
              name,
              softWrap: true,  // Allow text to wrap
              maxLines: 2,  // Allow text to break into a second line if necessary
              overflow: TextOverflow.ellipsis,  // Optional: Adds an ellipsis if the text overflows
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
