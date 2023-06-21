import 'package:equatable/equatable.dart';
import 'package:test_gradle_files/features/weather/domain/entities/city_temp_entity.dart';

class WeatherModel extends WeatherEntity with EquatableMixin {
  WeatherModel({
    required super.cityName,
    required super.temprature,
    required super.weatherText,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      cityName: map['city'],
      temprature: map['temp'],
      weatherText: map['weather-text'],
    );
  }
}
