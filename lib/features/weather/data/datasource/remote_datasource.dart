import 'dart:convert';
import 'package:http/http.dart' as http show Client;
import '../../../../core/servises/weather_service.dart';

import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherFromApi(int cityId, String cityName);
}

class WeatherRemoteDataSourceImp implements WeatherRemoteDataSource {
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
}
