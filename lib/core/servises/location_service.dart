import 'package:geolocator/geolocator.dart';
import 'package:test_gradle_files/core/error/exceptions.dart';

class LocationHelper {
  //* first of all get the location permission
  // todo top statement
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
      print('please enable gps'); //todo with a toast
    }
  }

  get long {
    return position.longitude;
  }

  get lat {
    return position.latitude;
  }
}
