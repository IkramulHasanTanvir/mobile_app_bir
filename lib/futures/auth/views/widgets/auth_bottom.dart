import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/common/widgets/custom_button.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class AuthBottom extends StatelessWidget {
  const AuthBottom({super.key, this.isLogin = false});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              onPressed: () {
                CustomNavigator.pushNamed(RouteName.contactSupport);
              },
              label: 'Contact Support'.tr,
              icon: Icon(Icons.phone, size: size.height * 0.020),
            ),
            CustomButton(
              onPressed: () {
                CustomNavigator.pushNamed(RouteName.areaManagerScreen);
              },
              label: 'Area Manager'.tr,
              icon: Icon(Icons.person, size: size.height * 0.020),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.04),
        if (isLogin) ...[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: TextStyle(
                  color: dividerTextColors,
                  fontSize: size.height * 0.014,
                ),
                text: 'By logging in you are accepting our ',
                children: [
                  TextSpan(
                    style: const TextStyle(color: primaryColor),
                    text: 'Terms & Conditions ',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        CustomNavigator.pushNamed(RouteName.privacyPolicy);
                      },
                  ),
                  const TextSpan(text: 'and '),
                  TextSpan(
                    style: const TextStyle(color: primaryColor),
                    text: 'Privacy Policy.',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        CustomNavigator.pushNamed(RouteName.privacyPolicy);
                      },
                  )
                ]),
          ),
          SizedBox(height: size.height * 0.008),
          Text(
            'version 1.3.1',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: dividerTextColors,
                fontSize: size.height * 0.014,
              ),
            ),
          ),
          //const SizedBox(height: 8)
        ],
      ],
    );
  }
}
