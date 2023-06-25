import 'package:geolocator/geolocator.dart';
import 'package:test_gradle_files/core/error/exceptions.dart';

class LocationHelper {
  final latKey = 'latitude';
  final longKey = 'longitude';
  late Position position;
  init() async {
    final x = await Geolocator.requestPermission();
    if (LocationPermission.always == x || LocationPermission.whileInUse == x) {
      if (await Geolocator.isLocationServiceEnabled()) {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
      }
    } else {
      throw GPSStatusException();
    }
  }

  get long {
    return position.longitude;
  }

  get lat {
    return position.latitude;
  }
}
