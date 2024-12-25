import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/bir_progress_indicator.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/common/widgets/snack_bar.dart';
import 'package:mobile_app_bir/data/controller/auth_controller.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/auth_bottom.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/custom_divider.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/custom_text_field.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/forgot_section.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/logo_and_title.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userIdTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool isCheckboxChecked = false;

  void updateCheckboxState(bool value) {
    setState(() {
      isCheckboxChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.044),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  LogoAndTitle(
                    title: 'Login'.tr,
                    subtitle: 'loginSubtitle'.tr,
                  ),
                  SizedBox(height: size.height * 0.035),
                  _buildTextFormFiled(),
                  ForgotSection(onCheckboxChanged: updateCheckboxState),
                  SizedBox(height: size.height * 0.04),
                  Visibility(
                    visible: true,
                    replacement: const BIRProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        _onTapLogin(isCheckboxChecked);
                      },
                      child: Text('Login'.tr),
                    ),
                  ),
                ],
              ),
              CustomDivider(title: 'More'.tr),
              const AuthBottom(isLogin: true),
            ],
          ),
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
            title: 'User ID :'.tr,
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
          CustomTextField(
            title: 'Password :'.tr,
            formField: TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ))),
              controller: _passwordTEController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                if (value?.trim().isEmpty == true) {
                  return 'Enter your password'.tr;
                }
                if (value!.length < 6) {
                  return 'Password must be at least 6 characters'.tr;
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onTapLogin(bool isCheckboxChecked) async {
    if (_globalKey.currentState?.validate() == true) {
      if (_userIdTEController.text.trim() == "admin" &&
          _passwordTEController.text.trim() == "admin123") {
        if (isCheckboxChecked) {
          await AuthController.saveUserData(_userIdTEController.text.trim(),
              _passwordTEController.text.trim());
        }
        CustomNavigator.pushAndRemoveAll(RouteName.homeScreen);
      } else {
        snackBar(
            title: "Login Failed".tr,
            content: "Invalid username or password. Please try again.".tr,
            actionColor: primaryColor);
      }
    } else {
      snackBar(
          title: "Form Incomplete".tr,
          content: "Please fill out all fields correctly.".tr,
          actionColor: wongColor);
    }
  }

  @override
  void dispose() {
    _userIdTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
