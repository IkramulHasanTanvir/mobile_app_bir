import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/assets_path.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/common/widgets/custom_bottom_sheet.dart';
import 'package:mobile_app_bir/futures/cart/views/widgets/cart_bottom_section.dart';
import 'package:mobile_app_bir/futures/cart/views/widgets/cart_item_card.dart';
import 'package:mobile_app_bir/futures/cart/views/widgets/order_summary.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_scaffold.dart';
import 'package:mobile_app_bir/futures/payment/views/payment_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.amount, required this.qty});

  final double amount;
  final int qty;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  double previousDue = 1500.00;
  double  grandTotal = 0;
  int curvedNavigationBarIndex = 0;

  @override
  void initState() {
    super.initState();
    updatePrice();
  }

  void _onDestinationSelected(int index) {
    if (curvedNavigationBarIndex != index) {
      setState(() {
        curvedNavigationBarIndex = index;
      });
    }
  }

  void updatePrice (){
    grandTotal = previousDue + widget.amount;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CustomScaffold(
      appBar: curvedNavigationBarIndex == 0
          ? CustomAppBar(title: 'Checkout'.tr, isCartScreen: false)
          : null,
      body: curvedNavigationBarIndex == 0
          ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.032),
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
                          qty: widget.qty,
                          title: 'Michel Tires',
                          subtitle: 'Name of Category',
                        ),
                      ],
                    ),
                    OrderSummary(
                      oderNo: 'XXXX-XXXX',
                      dateTime: '2024-12-03 12:30 PM',
                      totalItems: '01',
                      subTotal: widget.amount.toString(),
                      total: widget.amount.toString(),
                      previousDue: previousDue.toString(),
                      grandTotal: grandTotal.toString(),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.016),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to( PaymentScreen(amount: widget.amount,));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '',
                            ),
                            Text(
                              'Payment'.tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: size.height * 0.018,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.1),
                    CartBottomSection(
                      amountTitle: 'Total',
                      amount: widget.amount,
                      onTap: () {
                        showModalBottomSheet(
                          isDismissible: false,
                          context: context,
                          builder: (_) => CustomBottomSheet(
                            title: 'Your order is placed!'.tr,
                            subtitle:
                                'You can check the progress of your order in activity menu'
                                    .tr,
                            image: AssetsPath.group5781,
                          ),
                        );
                      },
                      buttonLabel: 'Place Order',
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
