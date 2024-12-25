import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/futures/auth/models/area_manager_model.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/app_bar_title.dart';
import 'package:mobile_app_bir/futures/auth/views/widgets/area_managers_tile.dart';

class AreaManagerScreen extends StatelessWidget {
  const AreaManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const AppBarTitle(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.048),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Area Managers'.tr,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: size.height * 0.028,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: areaManagers
                  .map(
                    (manager) => AreaManagersTile(
                      areaManager: manager,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
