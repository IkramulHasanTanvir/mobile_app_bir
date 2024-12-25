import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/futures/payment/views/widgets/AmountCard.dart';
import 'package:mobile_app_bir/futures/payment/views/widgets/PaymentOption.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.amount});

  final double amount;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar:  CustomAppBar(
        title: 'Payment'.tr,
        backButtonShow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(height: size.height * 0.024),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.032,vertical: size.height * 0.016),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Center(
                    child: AmountCard(amount: amount,),
                  ),
                  PaymentOption(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
