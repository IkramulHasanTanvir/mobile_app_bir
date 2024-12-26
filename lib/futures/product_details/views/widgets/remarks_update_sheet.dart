import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/futures/product_details/controller/remark_controller.dart';

class RemarksUpdateSheet extends StatefulWidget {
  const RemarksUpdateSheet({super.key});

  @override
  State<RemarksUpdateSheet> createState() => _RemarksUpdateSheetState();
}

class _RemarksUpdateSheetState extends State<RemarksUpdateSheet> {
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
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.048, vertical: size.height * 0.024),
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
                      child: Icon(
                        Icons.clear,
                        color: Colors.black,
                        size: size.height * 0.032,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.016),

                // Title
                GetBuilder<RemarkController>(
                  builder: (remarkController) {
                    return Text(
                      remarkController.ratingText.tr,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: size.height * 0.026,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.016),

                GetBuilder<RemarkController>(builder: (remarkController) {
                  return RatingBar.builder(
                    initialRating: remarkController.rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: remarkController.updateRatingText,
                  );
                }),

                SizedBox(height: size.height * 0.024),

                // Input Field
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Add a comment (Optional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                  ),
                  maxLines: size.height < 600 ? 2 : 4,
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  CustomNavigator.pop();
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
