import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  // Request permission dan get current location
  static Future<String> getCurrentCity() async {
    try {
      // untuk ngecek izin lokasi
      LocationPermission permission = await Geolocator.checkPermission();
      
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return 'MEDAN';
        }
      }
      
      if (permission == LocationPermission.deniedForever) {
        return 'MEDAN';
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Convert to city name
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String city = place.locality ?? place.subAdministrativeArea ?? 'MEDAN';
        return city.toUpperCase();
      }

      return 'MEDAN';
    } catch (e) {
      print('Error getting location: $e');
      return 'MEDAN';
    }
  }
}