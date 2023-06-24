import 'package:equatable/equatable.dart';

import '../../../../core/servises/weather_service.dart';

class WeatherEntity extends Equatable {
  final String cityName, weatherText;
  final double temprature;

  const WeatherEntity({
    required this.cityName,
    required this.temprature,
    required this.weatherText,
  });

  get imagePath => WeatherService.weatherTextToImagePath(weatherText);

  @override
  List<Object?> get props => [cityName, temprature, weatherText];
}
