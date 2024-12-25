import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    required this.oderNo,
    required this.dateTime,
    required this.totalItems,
    required this.subTotal,
    required this.total,
    required this.previousDue,
    required this.grandTotal,
  });

  final String oderNo;
  final String dateTime;
  final String totalItems;
  final String subTotal;
  final String total;
  final String previousDue;
  final String grandTotal;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: size.height * 0.016),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFFFD9D9),
              width: 1.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.050),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Oder No :\nDate/Time :',
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            SizedBox(height: size.height * 0.016),
                            Text('Total Items :\nSub-Total :\nTotal :',
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                )),
                            SizedBox(height: size.height * 0.004),
                            Text('Previous Due :',
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('$oderNo\n$dateTime',
                                textAlign: TextAlign.end,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            SizedBox(height: size.height * 0.016),
                            Text('$totalItems\n$subTotal\n$total',
                                textAlign: TextAlign.end,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                            SizedBox(height: size.height * 0.004),
                            Text(previousDue,
                                textAlign: TextAlign.end,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.008),
                    const Divider(
                      color: dividerColors,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Grand Total :',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Text(grandTotal,
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'Order Summary'.tr,
          ),
        ),
      ],
    );
  }
}
