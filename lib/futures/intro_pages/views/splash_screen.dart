import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app_bir/app/utils/assets_path.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/app/utils/navigator.dart';
import 'package:mobile_app_bir/data/controller/auth_controller.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    await AuthController.getUserId();
    await AuthController.getUserPass();
    if (AuthController.isLoggedIn()) {
      CustomNavigator.pushAndRemoveAll(RouteName.homeScreen);
    } else {
      CustomNavigator.pushAndRemoveAll(RouteName.promotionScreen);
    }
  }

  @override
  void initState() {
    super.initState();
    _moveNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: customLinearGradient,
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            right: 10,
            child: SvgPicture.asset(
              AssetsPath.manufacturingSVG,
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: size.height,
              width: 32,
              decoration: const BoxDecoration(
                gradient: customLinearGradient,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.38,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              AssetsPath.splashLogoSVG,
              height: 54,
              width: 305,
            ),
          ),
          Positioned(
            top: size.height * 0.48,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.1),
              child: LinearProgressIndicator(
                color: Color(0xFFED7561),
              ),
            )
          ),
          Positioned(
            top: size.height * 0.6,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              AssetsPath.manufacturingSVG,
            ),
          ),
          Positioned(
            bottom: size.height * 0.07,
            left: 0,
            right: 0,
            child: const Text(
              style: TextStyle(height: 2),
              'Version - 1.3.1\nDevelop By: AR IT Firm',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
