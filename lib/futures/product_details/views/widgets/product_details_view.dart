import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/futures/dashboard/views/widgets/card_button.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({
    super.key,
    required this.title,
    required this.category,
    required this.subCategory,
    required this.reviews,
    required this.stock,
    required this.onTap,
    required this.details, required this.reviewsPoint,
  });

  final String title;
  final String category;
  final String subCategory;
  final String details;
  final String reviews;
  final String reviewsPoint;
  final bool stock;
  final VoidCallback onTap;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                textStyle:  TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.022,
                  fontWeight: FontWeight.w600,
                ),
              ),
              text: '${widget.title}\n',
              children: [
                TextSpan(
                  style: GoogleFonts.poppins(
                    textStyle:  TextStyle(
                      fontSize: size.height * 0.016,
                      fontWeight: FontWeight.w500,
                      height: 1.8,
                    ),
                  ),
                  text: '${widget.category}\n',
                ),
                TextSpan(
                  style: GoogleFonts.poppins(
                    textStyle:  TextStyle(
                      fontSize: size.height * 0.016,
                      fontWeight: FontWeight.w500,
                      height: 1.8,
                    ),
                  ),
                  text: '${widget.subCategory}\n',
                ),
                TextSpan(
                  style: GoogleFonts.poppins(
                    textStyle:  TextStyle(
                      fontSize: size.height * 0.016,
                      fontWeight: FontWeight.w400,
                      height: 1.8,
                    ),
                  ),
                  children: [
                    TextSpan(
                      text: _isExpanded
                          ? widget.details
                          : '${widget.details.length > 120 ? widget.details.substring(0, 120) : widget.details}...',
                    ),
                    TextSpan(
                      text: _isExpanded ? ' Less\n' : ' More\n',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                    ),
                  ],
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Icon(
                        Icons.star,
                        size: size.height * 0.018,
                        color: Colors.amber,
                      ),
                      Text(
                        ' ${widget.reviewsPoint}',
                        style: GoogleFonts.poppins(
                          textStyle:  TextStyle(
                            fontSize: size.height * 0.018,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextSpan(
                  style: GoogleFonts.poppins(
                    textStyle:  TextStyle(
                      fontSize: size.height * 0.018,
                      fontWeight: FontWeight.w500,
                      color: dividerTextColors,
                      height: 2,
                    ),
                  ),
                  text: ' (${widget.reviews} Reviews)\n',
                ),
                TextSpan(
                  style: GoogleFonts.poppins(
                    textStyle:  TextStyle(
                      fontSize: size.height * 0.016,
                      fontWeight: FontWeight.w500,
                      color: dividerTextColors,
                    ),
                  ),
                  text: 'Stock: ',
                ),
                TextSpan(
                  style: GoogleFonts.poppins(
                    textStyle:  TextStyle(
                      fontSize: size.height * 0.016,
                      fontWeight: FontWeight.w500,
                      color: widget.stock ? successColor : primaryColor,
                      height: 3,
                    ),
                  ),
                  text: widget.stock ? 'Available\n' : 'Out of Stock\n',
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 38,
            right: 0,
            child: CardButton(
              title: 'Add',
              onTap: widget.onTap,
              isRedColor: true,
            ),
          ),
        ],
      ),
    );
  }
}
