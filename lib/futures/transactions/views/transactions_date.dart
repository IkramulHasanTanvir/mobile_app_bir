import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/custom_text_field.dart';
import 'package:mobile_app_bir/futures/transactions/views/transactions_info.dart';

class TransactionsDate extends StatefulWidget {
  const TransactionsDate({super.key});

  @override
  State<TransactionsDate> createState() => _TransactionsDateState();
}

class _TransactionsDateState extends State<TransactionsDate> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (selectedDate != null) {
      setState(() {
        controller.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Transactions'.tr, backButtonShow: false),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              CustomTextField(
                  title: 'From Date'.tr,
                  formField: TextFormField(
                    controller: _fromDateController,
                    decoration: InputDecoration(
                      hintText: 'Top to Select From Date',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_month),
                        onPressed: () {
                          _selectDate(context, _fromDateController);
                        },
                      ),
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty == true) {
                        return "Form Incomplete".tr;
                      }
                      return null;
                    },
                  )),
              CustomTextField(
                  title: 'To Date'.tr,
                  formField: TextFormField(
                    controller: _toDateController,
                    decoration: InputDecoration(
                      hintText: 'Top to Select From Date',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_month),
                        onPressed: () {
                          _selectDate(context, _toDateController);
                        },
                      ),
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty == true) {
                        return "Form Incomplete".tr;
                      }
                      return null;
                    },
                  ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState?.validate() == true){
                    Get.to(TransactionsInfo(
                      fromDate: _fromDateController.text,
                      toDate: _toDateController.text));}
                },
                child: Text(
                  'View Report'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
