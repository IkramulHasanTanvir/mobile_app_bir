import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/futures/navigation/controller/nav_controller.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_scaffold.dart';
import 'package:mobile_app_bir/futures/transactions/views/widgets/transaction_card.dart';

class TransactionsInfo extends StatefulWidget {
  const TransactionsInfo({super.key});

  @override
  State<TransactionsInfo> createState() => _TransactionsInfoState();
}

class _TransactionsInfoState extends State<TransactionsInfo> {
  final List<Map<String, dynamic>> _transactions = [
    {
      'billNo': '345345-34545',
      'date': '2024-09-23',
      'accountTitle': 'ABC Cash',
      'totalProduct': '1',
      'billed': 230.00,
      'received': '340.00 BDT',
      'status': 'paid',
    },
    {
      'billNo': '123456-78901',
      'date': '2024-09-22',
      'accountTitle': 'XYZ Store',
      'totalProduct': '2',
      'billed': 500.00,
      'received': '500.00 BDT',
      'status': 'unpaid',
    },
    {
      'billNo': '987654-32100',
      'date': '2024-09-21',
      'accountTitle': 'LMN Mart',
      'totalProduct': '3',
      'billed': 750.00,
      'received': '700.00 BDT',
      'status': 'unpaid',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(builder: (navController) {
      return CustomScaffold(
        appBar: navController.selectedIndex == 2
            ? CustomAppBar(title: 'Transactions'.tr)
            : null,
        body: navController.selectedIndex == 2
            ? _buildTransactionList()
            : screenList[navController.selectedIndex],
        bottomNavigationBar: CustomBottomNavBar(
          onDestinationSelected: navController.changePage,
          selectedIndex: navController.selectedIndex,
        ),
      );
    });
  }

  // Build the transaction list
  Widget _buildTransactionList() {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Form Date / To Date',
                  style: GoogleFonts.roboto(
                    textStyle:
                        const TextStyle(fontSize: 16, color: dividerColors),
                  ),
                ),
                Text(
                  '22-01-23 / 22-09-23',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.016),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                final transaction = _transactions[index];
                return TransactionCard(
                  billNo: transaction['billNo'],
                  date: transaction['date'],
                  accountTitle: transaction['accountTitle'],
                  totalProduct: transaction['totalProduct'],
                  billed: transaction['billed'],
                  received: transaction['received'],
                  status: transaction['status'],
                );
              },
            ),
            SizedBox(height: size.height * 0.12),
          ],
        ),
      ),
    );
  }
}
