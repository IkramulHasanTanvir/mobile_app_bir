import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/futures/payment/views/payment_screen.dart';
import 'package:mobile_app_bir/futures/transactions/views/widgets/transaction_button.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.billNo,
    required this.date,
    required this.accountTitle,
    required this.totalProduct,
    required this.billed,
    required this.received,
    required this.status,
    this.onTap,
  });

  final String billNo, date, accountTitle, totalProduct, received, status;

  final double billed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: size.height * 0.010),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: reportCardColor,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                offset: const Offset(0, 0),
                blurRadius: 5)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bill No: $billNo',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                )),
              ),
              Text(
                'Date: $date',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          const Divider(color: primaryColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Account Tile : $accountTitle',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                )),
              ),
              InkWell(
                onTap: onTap,
                child: const Icon(Icons.print_outlined, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('Total Product : $totalProduct', style: GoogleFonts.roboto()),
          Text('Billed : $billed BDT', style: GoogleFonts.roboto()),
          const SizedBox(height: 8),
          const Divider(color: reportCardColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Received : $received',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                  Text(
                    'Date: $date',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                ],
              ),
              TransactionButton(
                  onTap: () {
                    if (status != 'paid') {
                      Get.to(PaymentScreen(amount: billed));
                    }
                  },
                  label: (status.toString()).toUpperCase(),
                  color: status == 'paid' ? successColor : primaryColor)
            ],
          )
        ],
      ),
    );
  }
}
