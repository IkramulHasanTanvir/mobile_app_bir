import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class ForgotSection extends StatefulWidget {
  final Function(bool) onCheckboxChanged;

  const ForgotSection({super.key, required this.onCheckboxChanged});

  @override
  State<ForgotSection> createState() => _ForgotSectionState();
}

class _ForgotSectionState extends State<ForgotSection> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: checkboxColor,
              value: isCheck,
              onChanged: (bool? value) {
                setState(() {
                  isCheck = value!;
                });
                widget.onCheckboxChanged(isCheck);
              },
            ),
            Text(
              'Remember me'.tr,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: size.height * 0.014),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            CustomNavigator.pushNamed(RouteName.forgotPassScreen);
          },
          child: Text(
            'ForgotPassword'.tr,
            style: GoogleFonts.poppins(
                textStyle:  TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
                    fontSize: size.height * 0.014
            )),
          ),
        )
      ],
    );
  }
}
