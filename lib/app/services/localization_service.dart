import 'package:geolocator/geolocator.dart';

class LocalizationService {
  Future<Position?> getLocalization() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();

    if (!isEnable) {
      return null;
    }

    final permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ||
        permission == LocationPermission.unableToDetermine) {
      return null;
    }

    final position = await Geolocator.getCurrentPosition();
    return position;
  }
}
