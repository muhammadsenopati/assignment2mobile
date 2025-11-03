import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  // Minta izin dan dapatkan lokasi saat ini
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

      // mendapatkan posisi sekarang
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Ubah ke nama kota
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
