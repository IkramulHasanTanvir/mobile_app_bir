import 'package:flutter/material.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class BIRProgressIndicator extends StatelessWidget {
  const BIRProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: CircularProgressIndicator(
        backgroundColor: allCardColor,
        color: primaryColor,
        strokeWidth: 2,
      ),
    );
  }
}