import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/data/controller/auth_controller.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_scaffold.dart';
import 'package:mobile_app_bir/futures/setting/widgets/settings_tile.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CustomScaffold(
      appBar: CustomAppBar(title: ' Settings'.tr, backButtonShow: false),
      body: Padding(
          padding: EdgeInsets.only(top: size.height * 0.024),
          child: Column(
            children: [
              SettingsTile(
                icon: Icons.language,
                label: "Language".tr,
                ontTap: () {
                  CustomNavigator.pushNamed(RouteName.languageScreen);
                },
              ),
              SettingsTile(
                icon: Icons.logout,
                label: "Change Password".tr,
                ontTap: () {
                  CustomNavigator.pushNamed(RouteName.settingChangePass);
                },
              ),
              SettingsTile(
                icon: Icons.logout,
                label: "Logout".tr,
                ontTap: () {
                   AuthController.clearAccessToken();
                  CustomNavigator.pushAndRemoveAll(RouteName.loginScreen);
                },
              ),
            ],
          )),
    );
  }
}
