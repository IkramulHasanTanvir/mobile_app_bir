import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position?> getCurrentLocation() async {
    bool isGranted = await _isLocationPermissionGranted();
    if (isGranted) {
      bool isEnable = await _checkGPSServiceEnable();
      if (isEnable) {
        try {
          Position currentPosition = await Geolocator.getCurrentPosition(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.bestForNavigation,
              timeLimit: Duration(seconds: 10),
            ),
          );
          return currentPosition;
        } catch (e) {
          print("Error fetching location: $e");
          return null;
        }
      } else {
        Geolocator.openLocationSettings();
        print("GPS is disabled. Please enable it.");
        return null;
      }
    } else {
      bool isGranted = await _requestLocationPermission();
      if (isGranted) {
        return getCurrentLocation();
      }
      print("Location permission is not granted.");
      return null;
    }
  }

  Future<bool> _isLocationPermissionGranted() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<bool> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<bool> _checkGPSServiceEnable() async {
    return await Geolocator.isLocationServiceEnabled();
  }
}
