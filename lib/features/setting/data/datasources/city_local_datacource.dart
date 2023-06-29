import 'dart:convert';
import 'package:http/http.dart' as http show Client;
import '../../../../core/error/exceptions.dart';
import '../../../../core/servises/internet_service.dart';
import '../../../../core/servises/location_service.dart';
import '../../../../core/servises/permission_service.dart';
import '../../../../core/servises/sh_pref_service.dart';
import '../../../../core/servises/weather_service.dart';
import '../models/city_geo_model.dart';

abstract class CityLocalDataSource {
  // Future<CityModel> getCurrentCity();
  Future<void> cacheCity(CityGeoModel? cityGeoModel);
}

class CityLocalDataSourceImpl implements CityLocalDataSource {
  final cityKey = "CITY";
  final latKey = "Lat";
  final longKey = "Long";
  final cityIDKey = "CITY_ID";
  final String urlStart =
      'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search';
  SharedPref sharedPref = SharedPref(); //todo remember to inject it as well
  final client = http.Client();
  final PermissionHelper _permissionHelper = PermissionHelper();
  final LocationHelper _locationHelper = LocationHelper();
  final InternetService _internetService = InternetService();

  @override
  Future<bool> cacheCity(CityGeoModel? cityGeoModel) async {
    //* first we should get city by gps [service]
    //* before that we need get gps permission
    //* then we should get cityKey with that info
    //* finaly we can cache the result
    //* gps call
    if (await _internetService.testPing()) {
      late double longitude, latitude;
      if (cityGeoModel != null) {
        longitude = cityGeoModel.longitude;
        latitude = cityGeoModel.latitude;
      } else {
        bool permissionRes =
            await _permissionHelper.requestLocationPermission();
        if (permissionRes) {
          await _locationHelper.init();
          longitude = _locationHelper.long;
          latitude = _locationHelper.lat;
        } else {
          throw GPSPermissionException();
        }
      }
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
          return true;
        } else {
          throw CacheException();
        }
      }
    } else {
      // there is no internet connection
      // so try to save the city name and a bool 
      // that says last time we save city, we dont have inrernet connection
      throw Exception();
    }
  }

  String _makeUrl({
    required double longitude,
    required double latitude,
  }) =>
      '${WeatherService.findCityNameAPIStart}apikey=${WeatherService.apiKey}&q=$latitude%2C$longitude';
}
