import 'package:flutter/material.dart';
import 'package:mobile_app_bir/app/utils/assets_path.dart';
import 'package:mobile_app_bir/futures/payment/views/widgets/PaymentItem.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({super.key});

  @override
  _PaymentOptionState createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  String selectedOption = 'Cash Payment'; // Default selected option

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentItem(
            imagePath: AssetsPath.group5775,
            text: 'Cash Payment',
            value: selectedOption == 'Cash Payment',
            onChanged: (bool? value) {
              setState(() {
                selectedOption = 'Cash Payment';
              });
            },
          ),
          PaymentItem(
            imagePath: AssetsPath.group5948,
            text: 'Bank Deposit',
            value: selectedOption == 'Bank Deposit',
            onChanged: (bool? value) {
              setState(() {
                selectedOption = 'Bank Deposit';
              });
            },
          ),
          PaymentItem(
            imagePath: AssetsPath.group5775,
            text: 'Credit',
            value: selectedOption == 'Credit',
            onChanged: (bool? value) {
              setState(() {
                selectedOption = 'Credit';
              });
            },
          ),
        ],
      ),
    );
  }
}
