import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/common/widgets/snack_bar.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/custom_text_field.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/logo_and_title.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class SettingChangePass extends StatefulWidget {
  const SettingChangePass({super.key});

  @override
  State<SettingChangePass> createState() => _SettingChangePassState();
}

class _SettingChangePassState extends State<SettingChangePass> {
  final TextEditingController _currentTEController = TextEditingController();
  final TextEditingController _newTEController = TextEditingController();
  final TextEditingController _confirmTEController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ' Settings'.tr),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoAndTitle(
                isSetting: true,
                title: 'Change Password'.tr,
                subtitle: 'changePasswordSubtitle'.tr,
              ),
              _buildTextFormFiled(),
              ElevatedButton(
                onPressed: _onTapConfirm,
                child:  Text('Confirm'.tr),
              ),
              const SizedBox(),
              const SizedBox()
              //const AuthBottom(),
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
                if (value?.isEmpty == true) return 'Confirm your new password'.tr;
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

          CustomNavigator.pushAndRemoveAll(RouteName.settingOtp);
        } else {
          snackBar(
            title: "Invalid New Password".tr,
            content: "New password cannot be the same as the current password.".tr,
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
