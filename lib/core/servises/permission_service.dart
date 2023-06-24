import 'package:permission_handler/permission_handler.dart';
import 'package:test_gradle_files/core/error/exceptions.dart';
// import 'package:location/location.dart';

class PermissionHelper {
  Future<bool> requestLocationPermission() async {
    PermissionStatus permission = await Permission.location.request();
    while (permission != PermissionStatus.granted) {
      permission = await Permission.location.request();
      if(permission.isPermanentlyDenied){
        throw GPSPermissionException();
        return false;
      }
    }
    //todo if the user permanetly denny request , so what ?
    return permission == PermissionStatus.granted;
  }

  // static Future<bool> requestLocation() async {
  //   Location location = Location();

  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;
  //   bool _serviceEnabled;

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       //todo fill this spiot
  //     }
  //   }
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return true;
  //     }
  //   }

  //   _locationData = await location.getLocation();
  //   return false;
  // }
}
