import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(
            24,
          ))),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.044),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    )),
              ],
            ),
            Center(child: Image.asset(image,height: 130,width: 130,)),
            Text(
              title,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: size.height * 0.026,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ),
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: dividerTextColors, fontSize: size.height * 0.016),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  CustomNavigator.pushAndRemoveAll(RouteName.homeScreen);
                },
                child: Text('OK, Got It'.tr)),
          ],
        ),
      ),
    );
  }
}
