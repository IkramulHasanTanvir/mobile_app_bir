import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/futures/auth/models/area_manager_model.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/area_managers_tile.dart';

class CartBottomSection extends StatelessWidget {
  const CartBottomSection({
    super.key,
    required this.amountTitle,
    required this.amount,
    required this.onTap,
    required this.buttonLabel,
  });

  final String amountTitle;
  final double amount;
  final VoidCallback onTap;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.032, vertical: size.height * 0.016),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.2),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            border: Border.all(color: Colors.green),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    amountTitle.tr,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: size.height * 0.018,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    amount.toString(),
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: size.height * 0.018,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.018),
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(backgroundColor: successColor),
                child: Text(buttonLabel.tr),
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.054),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.020),
          child: Text(
            'Area Managers'.tr,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: size.height * 0.020, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        AreaManagersTile(
          areaManager: areaManagers.first,
        ),
        SizedBox(height: size.height * 0.026),
      ],
    );
  }
}
