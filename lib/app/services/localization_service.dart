import 'package:geolocator/geolocator.dart';

class LocalizationService {
  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      print('Permissão de localização negada permanentemente.');
    }
  }

  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Serviço de localização desativado.");
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Permissão negada.");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Permissão permanentemente negada.");
      return null;
    }

    Position position = await Geolocator.getCurrentPosition();
    print("Localização atual: ${position.latitude}, ${position.longitude}");
    return position;
  }
}
