import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/common/widgets/snack_bar.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/auth_bottom.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/custom_text_field.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/logo_and_title.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final TextEditingController _userIdTEController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width * 0.044),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                LogoAndTitle(
                  title: 'Forgot Password'.tr,
                  subtitle: 'forgotPasswordSubtitle'.tr,
                ),
                SizedBox(height: size.height * 0.035),
                _buildTextFormFiled(),
                SizedBox(height: size.height * 0.04),
                ElevatedButton(
                    onPressed: _onTapSubmit, child: Text('Submit'.tr)),
              ],
            ),
            const AuthBottom(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormFiled() {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          CustomTextField(
            title: 'User ID/ Profile ID :'.tr,
            formField: TextFormField(
              decoration: const InputDecoration(hintText: 'Enter your User ID'),
              controller: _userIdTEController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                if (value?.trim().isEmpty == true) {
                  return 'Enter a valid User ID'.tr;
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onTapSubmit() {
    if (_globalKey.currentState?.validate() == true) {
      final userId = _userIdTEController.text.trim();
      if (userId == "admin") {
        CustomNavigator.pushNamed(RouteName.changePassScreen);
      } else {
        snackBar(
          title: "Verification Failed".tr,
          content: "User ID not recognized. Please try again.".tr,
          actionColor: primaryColor,
        );
      }
    } else {
      snackBar(
        title: "Form Incomplete".tr,
        content: "Please enter a valid User ID.".tr,
        actionColor: wongColor,
      );
    }
  }

  @override
  void dispose() {
    _userIdTEController.dispose();
    super.dispose();
  }
}
