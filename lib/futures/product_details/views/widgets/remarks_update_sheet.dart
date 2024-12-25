import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class RemarksUpdateSheet extends StatelessWidget {
  const RemarksUpdateSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width * 0.048,vertical: size.height * 0.024),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Close Button
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        CustomNavigator.pop();
                      },
                      child:  Icon(
                        Icons.clear,
                        color: Colors.black,
                        size: size.height * 0.032,
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: size.height * 0.016),

                // Title
                Text(
                  'Add Your Remarks'.tr,
                  style: GoogleFonts.poppins(
                    textStyle:  TextStyle(
                      fontSize: size.height * 0.026,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                 SizedBox(height: size.height * 0.016),

                // Star Rating
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: size.height * 0.060, color: Colors.grey),
                    Icon(Icons.star, size: size.height * 0.060, color: Colors.grey),
                    Icon(Icons.star, size: size.height * 0.060, color: Colors.grey),
                    Icon(Icons.star, size: size.height * 0.060, color: Colors.grey),
                    Icon(Icons.star, size: size.height * 0.060, color: Colors.grey),
                  ],
                ),
                 SizedBox(height: size.height * 0.016),

                // Input Field
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Add a comment (Optional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  ),
                  maxLines: size.height < 600 ? 2 : 4,
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  CustomNavigator.pushAndRemoveAll(RouteName.homeScreen);
                },
                child: Text(
                  'Done'.tr,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
