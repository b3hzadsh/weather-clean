import 'dart:convert';
import 'package:http/http.dart' as http show Client;
import '../../../../core/servises/weather_service.dart';
import 'package:test_gradle_files/features/weather/domain/entities/city_temp_entity.dart';

import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherFromApi();
}

class WeatherRemoteDataSourceImp implements WeatherRemoteDataSource {
  final client = http.Client();
  final WeatherService weatherService = WeatherService();

  @override
  Future<WeatherModel> getWeatherFromApi() async {
    final findCityInfoUrl = weatherService.requestCityNameUrl(
      latitude: 35.715298,
      longitude: 51.404343,
    );
    final responseCityInfo = await client.get(
      Uri.parse(findCityInfoUrl),
    );
    final resposeBodyCityInfo = json.decode(responseCityInfo.body);
    Map<String, dynamic> resultMap = {
      'city': resposeBodyCityInfo['AdministrativeArea']['LocalizedName'],
    };
    final cityCode = resposeBodyCityInfo['Key'];
    //
    final findWeatherInfoUrl = weatherService.requestCityWeatherUrl(
      cityCode: cityCode,
    );
    final response = await client.get(
      Uri.parse(findWeatherInfoUrl),
    );
    final resposeBody = json.decode(response.body);
    resultMap['temp'] = resposeBody[0]['Temperature']['Metric']['Value'];
    resultMap['weather-text'] = resposeBody[0]['WeatherText'];
    return WeatherModel.fromMap(resultMap);
  }
}
