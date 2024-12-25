import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/common/widgets/snack_bar.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/auth_bottom.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/custom_text_field.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/logo_and_title.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  final TextEditingController _currentTEController = TextEditingController();
  final TextEditingController _newTEController = TextEditingController();
  final TextEditingController _confirmTEController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _obscureText = true;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                LogoAndTitle(
                  title: 'Change Password'.tr,
                  subtitle: 'changePasswordSubtitle'.tr,
                ),
                SizedBox(height: size.height * 0.035),
                _buildTextFormFiled(),
                SizedBox(height: size.height * 0.04),
                ElevatedButton(
                  onPressed: _onTapConfirm,
                  child: Text('Confirm'.tr),
                ),
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
            title: 'Current Password'.tr,
            formField: TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                  hintText: 'Enter your current password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ))),
              controller: _currentTEController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) =>
                  value?.isEmpty == true ? 'Enter your password'.tr : null,
            ),
          ),
          CustomTextField(
            title: 'New Password'.tr,
            formField: TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                  hintText: 'Enter your new password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ))),
              controller: _newTEController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value?.isEmpty == true) return 'Enter your new password'.tr;
                if (value!.length < 6) {
                  return 'Password must be at least 6 characters'.tr;
                }
                return null;
              },
            ),
          ),
          CustomTextField(
            title: 'Confirm New Password'.tr,
            formField: TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                  hintText: 'Re-enter your new password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ))),
              controller: _confirmTEController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value?.isEmpty == true) {
                  return 'Confirm your new password'.tr;
                }
                if (value != _newTEController.text) {
                  return 'Passwords do not match'.tr;
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onTapConfirm() {
    const String savedPassword = "admin123";

    if (_globalKey.currentState?.validate() == true) {
      // Check if the current password matches the saved password
      if (_currentTEController.text.trim() == savedPassword) {
        // Check if the new password is different from the saved password
        if (_newTEController.text.trim() != savedPassword) {

          CustomNavigator.pushNamed(RouteName.pinConfirmationScreen);
        } else {
          snackBar(
            title: "Invalid New Password".tr,
            content:
                "New password cannot be the same as the current password.".tr,
            actionColor: Colors.red,
          );
        }
      } else {
        snackBar(
          title: "Incorrect Password".tr,
          content: "The current password you entered is incorrect.".tr,
          actionColor: Colors.red,
        );
      }
    } else {
      snackBar(
        title: "Form Incomplete".tr,
        content: "Please fill out all fields correctly.".tr,
        actionColor: Colors.amber,
      );
    }
  }

  @override
  void dispose() {
    _currentTEController.dispose();
    _newTEController.dispose();
    _confirmTEController.dispose();
    super.dispose();
  }
}
