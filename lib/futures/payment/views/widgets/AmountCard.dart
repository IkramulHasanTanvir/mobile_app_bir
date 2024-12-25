import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/assets_path.dart';
import 'package:mobile_app_bir/futures/Report/report_screen.dart';

class AmountCard extends StatelessWidget {
  const AmountCard({super.key, required this.amount});

  final double amount;


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF74C799),
                Color(0xFF329E62),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(),
                child: Image.asset(AssetsPath.intersect),
              ),
              Positioned(
                top: 8,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Amount",
                          style: GoogleFonts.acme( textStyle:  TextStyle(
                            fontSize: size.height * 0.022,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),),
                        InkWell(
                          onTap: (){
                            Get.to(const ReportScreen());
                          },
                          child: const Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      amount.toString(),
                      style: GoogleFonts.acme( textStyle:  TextStyle(
                        fontSize: size.height * 0.034,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),

                      ),),
                    const Divider(thickness: 1, color: Colors.white54),
                  ],
                ),
              )
            ],
          ),
                ),

        ],
      ),
    );
  }
}
