import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/futures/auth/models/area_manager_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class AreaManagersTile extends StatelessWidget {
  const AreaManagersTile({super.key, required this.areaManager});

  final AreaManagerModel areaManager;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(areaManager.imageUlr),
          ),
          title: Text(
            areaManager.title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: size.height * 0.018),
            ),
          ),
          subtitle: Text(
            areaManager.subtitle,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: size.height * 0.016,
                color: cardSubtitleColor,
              ),
            ),
          ),
          trailing: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  content: Text('Are you sure you want to proceed?'.tr),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel'.tr,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _callNumber(areaManager.phoneNumber),
                      child: Text('Call'.tr,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: dividerColors.withOpacity(0.6),
                  shape: BoxShape.circle),
              child: const Icon(Icons.phone),
            ),
          ),
        ),
        Divider(
          color: dividerColors.withOpacity(0.2),
        )
      ],
    );
  }

  Future<void> _callNumber(String phoneNumber) async {
    // Request phone call permission
    PermissionStatus permissionStatus = await Permission.phone.request();

    if (permissionStatus.isGranted) {
      final Uri url = Uri(scheme: 'tel', path: phoneNumber);

      if (await canLaunchUrl(url)) {
        // Launch the dialer
        if (!await launchUrl(url)) {
          throw Exception('Could not launch phone number: $phoneNumber');
        }
      } else {
        throw Exception('Device does not support phone calls');
      }
    } else if (permissionStatus.isDenied) {
      throw Exception('Phone call permission denied');
    } else if (permissionStatus.isPermanentlyDenied) {
      // Permission permanently denied, suggest the user enable it via settings
      await openAppSettings();
      throw Exception('Phone call permission permanently denied. Please enable it in settings.');
    }
  }

}
