import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class PassUpdateSheet extends StatelessWidget {
  const PassUpdateSheet({super.key});

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
            Stack(
              children: [
                const Icon(
                  Icons.lock,
                  size: 130,
                  color: lockColor,
                ),
                Positioned(
                    bottom: 2,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.check_circle,
                        size: 57,
                        color: checkMarkColors,
                      ),
                    )),
              ],
            ),
            Text(
              'passChangeSuccessTitle'.tr,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: size.height * 0.026,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ),
            Text(
              'passChangeSuccessSubtitle'.tr,
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
