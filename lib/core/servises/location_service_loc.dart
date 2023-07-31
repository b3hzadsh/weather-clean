import 'package:location/location.dart';
import 'package:test_gradle_files/core/error/exceptions.dart';
/*
class LocationHelper {
  Location location = Location();
  LocationData? position;
  doGPS() async {
    print("object");
    position = await location.getLocation();
  }

  init() async {
    final _permissionStatus = await checkLocationPermission();
    if (_permissionStatus == PermissionStatus.granted ||
        _permissionStatus == PermissionStatus.grantedLimited) {
      final _isLocationServiceEnable = await isLocationServiceEnabled();
      if (_isLocationServiceEnable) {
        doGPS();
        return;
      } else {
        final xd = await requestLocationService();
        if (xd) {
          doGPS();
          return;
        } else {
          throw GPSStatusException();
        }
      }
    } else {
      final result = await requestLocationPermission();
      if (result == PermissionStatus.denied ||
          result == PermissionStatus.deniedForever) {
        throw GPSPermissionException();
      }
      final _isLocationServiceEnable = await isLocationServiceEnabled();
      if (_isLocationServiceEnable) {
        doGPS();
        return;
      } else {
        final xd = await requestLocationService();
        if (xd) {
          doGPS();
          return;
        } else {
          throw GPSStatusException();
        }
      }
      // todo set the location var
    }
  }

  Future<bool> isLocationServiceEnabled() async {
    return await location.serviceEnabled();
  }

  Future<bool> requestLocationService() async {
    bool result = await location.requestService();
    return result;
  }

  Future<PermissionStatus> checkLocationPermission() async {
    return await location.hasPermission();
  }

  Future<PermissionStatus> requestLocationPermission() async {
    return await location.requestPermission();
  }

  Future<LocationData> getCurrentLocation() async {
    return await location.getLocation();
  }

  get long {
    if (position != null) {
      doGPS();
    }
    return myRound(position!.longitude!);
  }

  get lat {
    if (position != null) {
      doGPS();
    }
    return myRound(position!.latitude!);
  }
  get positionary async {
    final i = await location.getLocation();
    if(i == null){
      print('ridam to in pakcage');
    }
    Map<String,double> res;
    res = {
      'long': i.longitude!, 
      'lat': i.latitude!, 
    };
    return res;
  }
  double myRound(double n) {
    return double.parse(n.toStringAsFixed(6));
  }
}
*/