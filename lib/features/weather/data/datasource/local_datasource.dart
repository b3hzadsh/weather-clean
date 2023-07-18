import 'package:http/http.dart' as http show Client;
import '../../../../core/error/exceptions.dart';
import '../../../../core/servises/sh_pref_service.dart';
import '../../../../core/servises/weather_service.dart';

import '../../../setting/data/models/city_model.dart';

abstract class WeatherLocalDataSource {
  Future<CityModel> getCurrentCity();
}

class WeatherLocalDataSourceImp implements WeatherLocalDataSource {
  //todo static string are using in multiple features, take them to core
  final cityKey = "CITY";
  final cityIDKey = "CITY_ID";
  final String urlStart =
      'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search';

  final SharedPref sharedPref;
  final http.Client client;
  final WeatherService weatherService;

  WeatherLocalDataSourceImp({
    required this.sharedPref,
    required this.client,
    required this.weatherService,
  });

  @override
  Future<CityModel> getCurrentCity() async {
    final cityName = await sharedPref.getString(cityKey);
    final cityId = await sharedPref.getInt(cityIDKey);
    if (cityName == '' || cityId == 00) {
      throw CacheException();
    }
    return CityModel(cityId: cityId, cityName: cityName);
  }
}
