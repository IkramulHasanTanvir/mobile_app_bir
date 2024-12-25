import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:mobile_app_bir/futures/navigation/views/widgets/custom_scaffold.dart';
import 'package:mobile_app_bir/futures/setting/language/controller/language_controller.dart';
import 'package:mobile_app_bir/futures/setting/language/views/widgets/language_tile.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int curvedNavigationBarIndex = 4;

  final LanguageController _languageController = LanguageController();

  @override
  void initState() {
    super.initState();
    _initializeLanguageSettings();
  }

  Future<void> _initializeLanguageSettings() async {
    await _languageController.loadSettings();
    setState(() {});
  }

  void _onLanguageChange(String label, bool value) async {
    await _languageController.updateSettings(label, value);
    setState(() {});
  }

  void _onDestinationSelected(int index) {
    if (curvedNavigationBarIndex != index) {
      setState(() {
        curvedNavigationBarIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: curvedNavigationBarIndex == 4
          ? CustomAppBar(title: 'Language'.tr)
          : null,
      body: curvedNavigationBarIndex == 4
          ? _buildLanguageSettings()
          : screenList[curvedNavigationBarIndex],
      bottomNavigationBar: CustomBottomNavBar(
        onDestinationSelected: _onDestinationSelected,
        selectedIndex: curvedNavigationBarIndex,
      ),
    );
  }

  Widget _buildLanguageSettings() {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.016),
          Text(
            'Language'.tr,
            style: TextStyle(
                fontSize: size.height * 0.028, fontWeight: FontWeight.bold),
          ),
          Text(
            'Select your preferable language'.tr,
            style: TextStyle(fontSize: size.height * 0.016),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _languageController.settingsItems.length,
              itemBuilder: (context, index) {
                final item = _languageController.settingsItems[index];
                return LanguageTile(
                  logo: item["logo"],
                  label: item["label"],
                  checked: item["checked"],
                  onChanged: (bool? newValue) {
                    setState(() {
                      for (var element in _languageController.settingsItems) {
                        element["checked"] = false;
                      }

                      _onLanguageChange(item['label'], newValue!);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
