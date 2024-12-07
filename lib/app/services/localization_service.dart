import 'package:geolocator/geolocator.dart';

class LocalizationService {
  Future<Position?> getLocalization() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();

    if (!isEnable) {
      return null;
    }

    final statusPermissions = await Geolocator.checkPermission();

    if (statusPermissions == LocationPermission.denied ||
        statusPermissions == LocationPermission.deniedForever ||
        statusPermissions == LocationPermission.unableToDetermine) {
      final permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever ||
          permission == LocationPermission.unableToDetermine) {
        return null;
      }
    }

    final position = await Geolocator.getCurrentPosition();
    return position;
  }

  double calculateDistanceBetweenUserAndMarket(
    Position position,
  ) {
    const marketLongitute = -122.084;
    const marketLatitude = 37.4219983;
    return Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      marketLatitude,
      marketLongitute,
    );
  }
}
