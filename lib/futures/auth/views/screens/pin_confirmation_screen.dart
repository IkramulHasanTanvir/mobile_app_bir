import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/snack_bar.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/logo_and_title.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/pass_update_sheet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinConfirmationScreen extends StatefulWidget {
  const PinConfirmationScreen({super.key});

  @override
  State<PinConfirmationScreen> createState() => _PinConfirmationScreenState();
}

class _PinConfirmationScreenState extends State<PinConfirmationScreen> {
  final TextEditingController _pinTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.044),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoAndTitle(
                title: 'PIN Confirmation'.tr,
                subtitle: 'PINConfirmationSubtitle'.tr,
              ),
              SizedBox(height: size.height * 0.035),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  controller: _pinTEController,
                  backgroundColor: Colors.transparent,
                  appContext: (context),
                  length: 4,
                  obscureText: true,
                  obscuringCharacter: 'X',
                  pinTheme: PinTheme(
                    fieldWidth: 50,
                    fieldHeight: 50,
                    activeFillColor: Colors.transparent,
                    selectedFillColor: Colors.transparent,
                    inactiveFillColor: Colors.transparent,
                    inactiveColor: pinFieldColors,
                    selectedColor: Colors.black,
                    activeColor: pinFieldColors,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enableActiveFill: true,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              ElevatedButton(
                  onPressed: _updatePassBottomSheet, child: Text('Submit'.tr)),
            ],
          ),
        ),
      ),
    );
  }

  void _updatePassBottomSheet() {
    if (_pinTEController.text.trim() == '0000') {
      showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (context) {
          return const PassUpdateSheet();
        },
      );
    } else {
      snackBar(
        title: "Incorrect PIN".tr,
        content: "The PIN you entered is incorrect.".tr,
        actionColor: Colors.red,
      );
    }
  }

  @override
  void dispose() {
    _pinTEController.dispose();
    super.dispose();
  }
}
