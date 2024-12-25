import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/assets_path.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/futures/home_pages/models/company_model.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class CompanyListTile extends StatelessWidget {
  const CompanyListTile({super.key, required this.company});

  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.006),
      child: InkWell(
        onTap: () {
          CustomNavigator.pushAndRemoveAll(RouteName.bottomNavBar);
        },
        child: Container(
          padding: EdgeInsets.all(size.height * 0.012),
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 1),
            borderRadius: BorderRadius.circular(10),
            color: cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(AssetsPath.icon, height: size.height * 0.024),
                      SizedBox(width: size.width * 0.032),
                      Text(
                        company.title,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: size.height * 0.014)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        textAlign: TextAlign.end,
                        'Total Product: ${company.productCount}',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: size.height * 0.016)),
                      ),
                      SizedBox(width: size.width * 0.008),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: size.height * 0.016,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.088, top: size.height * 0.006),
                child: Text(
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  company.companyName,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: cardSubtitleColor,
                          fontSize: size.height * 0.012)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
