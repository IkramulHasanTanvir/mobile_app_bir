import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_links/app_links.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/custom_app_bar.dart';
import 'package:mobile_app_bir/common/widgets/snack_bar.dart';
import 'package:mobile_app_bir/futures/home_pages/models/company_model.dart';
import 'package:mobile_app_bir/futures/home_pages/views/widgets/banner_top_section.dart';
import 'package:mobile_app_bir/futures/home_pages/views/widgets/company_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final AppLinks _appLinks = AppLinks();  // Instance of AppLinks
  late final StreamSubscription<Uri?> _sub;

  @override
  void initState() {
    super.initState();
    // Listen for URI link stream
    _sub = _appLinks.uriLinkStream.listen((uri) {
      if (uri != null) {
        if(uri.pathSegments.first =="refer" && mounted){
          final id = uri.pathSegments.lastOrNull;
          if(id!=null && int.tryParse(id)!=null){
            snackBar(
              title: "Your link ID",
              content: 'ID: ${id}',
              actionColor: Colors.green,
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    // Cancel the subscription when the widget is disposed
    _sub.cancel();
    super.dispose();
  }
  /*String ipMessage = "Fetching IP...";
  final LocationService _locationService = LocationService();
  String _locationMessage = "Fetching location...";

  @override
  void initState() {
    super.initState();
    // getIpAddress();
    // _getLocation();
  }

  void _getLocation() async {
    Position? position = await _locationService.getCurrentLocation();
    if (position != null) {
      setState(() {
        _locationMessage =
        "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      });
    } else {
      setState(() {
        _locationMessage = "Failed to get location.";
      });
    }
    snackBar(
      title: "Your location",
      content: _locationMessage,
      actionColor: Colors.yellow,
    );
  }

  Future<void> getIpAddress() async {
    IpService ipService = IpService();
    String? ip = await ipService.getUserIp();
    setState(() {
      if (ip != null) {
        ipMessage = "Your IP Address is: $ip";
      } else {
        ipMessage = "Could not fetch IP.";
      }
      snackBar(
        title: "Your Ip",
        content: ipMessage,
        actionColor: Colors.green,
      );
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home'.tr,
        isNotHomeScreen: false,
        backButtonShow: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top section of the Home Screen
            const BannerTopSection(),

            // Company Summary Section
            Padding(
              padding: EdgeInsets.all(size.height * 0.024),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Company List'.tr,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: size.height * 0.016,
                        color: companyColors,
                      ),
                    ),
                  ),
                  // Divider for separation
                  const Divider(color: dividerColors),
                  SizedBox(height: size.height * 0.008),

                  // List of Summary Cards
                  Column(
                    children: companyList
                        .map((company) => CompanyListTile(
                              company: company,
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
