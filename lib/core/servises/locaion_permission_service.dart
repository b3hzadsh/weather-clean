// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart' as ph;

/*
class LocationService {
  Location location = Location();
  late LocationData locData;
  double get  long => locData.longitude!;
  double get  lat => locData.latitude!;
  Future<bool> init() async {
    ph.PermissionStatus permission =
        await ph.Permission.locationWhenInUse.status;
    while (permission != ph.PermissionStatus.granted) {
      permission = await ph.Permission.locationWhenInUse.request();
      if (permission.isPermanentlyDenied) {
        return false;
        print('no access to gps info'); //todo handle with toast or some thing
      }
    }
    bool serviceEnabled = await location.serviceEnabled();
    while (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }
    locData = await location.getLocation();
    return true;
  }
}
*/