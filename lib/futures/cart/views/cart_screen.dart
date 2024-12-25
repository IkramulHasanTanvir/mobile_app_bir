import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/futures/cart/views/checkout_screen.dart';
import 'package:mobile_app_bir/futures/cart/views/widgets/cart_bottom_section.dart';
import 'package:mobile_app_bir/futures/cart/views/widgets/cart_item_card.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_scaffold.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int qnty = 1;
  final double pricePerItem = 300.00;
  double amount = 300.00;
  int curvedNavigationBarIndex = 0;

  void _onDestinationSelected(int index) {
    if (curvedNavigationBarIndex != index) {
      setState(() {
        curvedNavigationBarIndex = index;
      });
    }
  }

  void _updateAmount() {
    setState(() {
      amount = pricePerItem * qnty;
    });
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CustomScaffold(
      appBar: curvedNavigationBarIndex == 0
          ? CustomAppBar(title: 'Carts'.tr, isCartScreen: false)
          : null,
      body: curvedNavigationBarIndex == 0
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.032),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Add Items'.tr,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  color: Colors.blue,
                                  fontSize: size.height * 0.016,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                            ),
                          ],
                        ),
                        CartItemCard(
                          qty: qnty,
                          title: 'Michel Tires',
                          subtitle: 'Name of Category',
                          onTapRemove: () {
                            if (qnty > 1) {
                              qnty--;
                              _updateAmount();
                            }
                            setState(() {});
                          },
                          onTapAdd: () {
                            qnty++;
                            _updateAmount();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.1),
                    CartBottomSection(
                      amountTitle: 'Sub-Total',
                      amount: amount,
                      onTap: () {
                        Get.to(() => CheckoutScreen(amount: amount, qty: qnty,));
                      },
                      buttonLabel: 'Proceed to Checkout',
                    ),
                    SizedBox(height: size.height * 0.1),
                  ],
                ),
              ),
            )
          : screenList[curvedNavigationBarIndex],
      bottomNavigationBar: CustomBottomNavBar(
        onDestinationSelected: _onDestinationSelected,
        selectedIndex: curvedNavigationBarIndex,
      ),
    );
  }
}
