import 'dart:convert';
import 'package:http/http.dart' as http show Client;
import '../../../../core/error/exceptions.dart';
import '../../../../core/servises/sh_pref_service.dart';
import '../../../../core/servises/weather_service.dart';

import '../../../setting/data/models/city_model.dart';
import '../models/weather_model.dart';

abstract class WeatherLocalDataSource {
  Future<WeatherModel> getWeatherFromApi(int cityId, String cityName);
  Future<CityModel> getCurrentCity();
}

class WeatherLocalDataSourceImp implements WeatherLocalDataSource {
  //todo static string are using in multiple features, take them to core
  final cityKey = "CITY";
  final cityIDKey = "CITY_ID";
  final String urlStart =
      'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search';
  SharedPref sharedPref = SharedPref(); //todo remember to inject it as well

  final client = http.Client();
  final WeatherService weatherService = WeatherService();

  @override
  Future<WeatherModel> getWeatherFromApi(int cityID, String cityName) async {
    Map<String, dynamic> resultMap = {
      'city': cityName,
    };
    final findWeatherInfoUrl =
        weatherService.requestCityWeatherUrl(cityCode: '$cityID');
    final response = await client.get(
      Uri.parse(findWeatherInfoUrl),
    );
    final resposeBody = json.decode(response.body);
    resultMap['temp'] = resposeBody[0]['Temperature']['Metric']['Value'];
    resultMap['weather-text'] = resposeBody[0]['WeatherText'];
    return WeatherModel.fromMap(resultMap);
  }

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
