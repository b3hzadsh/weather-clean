import 'dart:convert';
import 'package:http/http.dart' as http show Client;
import '../../../../core/error/exceptions.dart';
import '../../../../core/servises/location_service.dart';
import '../../../../core/servises/permission_service.dart';
import '../../../../core/servises/sh_pref_service.dart';
import '../../../../core/servises/weather_service.dart';
import '../models/city_model.dart';

abstract class CityLocalDataSource {
  Future<CityModel> getCurrentCity();
  Future<void> cacheCity();
}

class CityLocalDataSourceImpl implements CityLocalDataSource {
  final cityKey = "CITY";
  final cityIDKey = "CITY_ID";
  final String urlStart =
      'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search';
  SharedPref sharedPref = SharedPref(); //todo remember to inject it as well
  final client = http.Client();
  final PermissionHelper permissionHelper = PermissionHelper();
  final LocationHelper locationHelper = LocationHelper();

  @override
  Future<bool> cacheCity() async {
    //* first we should get city by gps [service]
    //* before that we need get gps permission
    //* then we should get cityKey with that info
    //* finaly we can cache the result

    //* gps call
    bool permissionRes = await permissionHelper.requestLocationPermission();
    if (permissionRes) {
      await locationHelper.init();
      double longitude = locationHelper.long;
      double latitude = locationHelper.lat;
      //* api request
      String url = _makeUrl(latitude: latitude, longitude: longitude);
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'content-type': 'application/json',
        },
      );
      if (response.statusCode != 200) {
        throw ServerException();
      } else {
        final respose = json.decode(response.body);
        final cityName = respose['AdministrativeArea']['LocalizedName'];
        final cityCode = respose['Key'];
        if (cityName != '' && cityCode != '') {
          await sharedPref.setString(cityKey, cityName);
          await sharedPref.setInt(cityIDKey, int.parse(cityCode));
          print('city saved in shprefs with name : $cityName and code : $cityCode');
          print(
            'city local datasource :: lat:$latitude long:$longitude saved in sharedPref',
          );
          return true;
        } else {
          throw CacheException();
        }
      }
    } else {
      throw GPSPermissionException();
    }
  }

  @override
  Future<CityModel> getCurrentCity() async {
    final cityName = await sharedPref.getString(cityKey);
    final cityId = await sharedPref.getInt(cityIDKey);
    if (cityName == '' || cityId == 00) {
      throw CacheException();
    }
    return CityModel(cityName: cityName, cityId: cityId);
  }

  String _makeUrl({required double longitude, required double latitude}) {
    return '${WeatherService.findCityNameAPIStart}apikey=${WeatherService.apiKey}&q=$latitude%2C$longitude';
  }
}
