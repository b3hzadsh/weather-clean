import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName, weatherText;
  final double temprature;

  const WeatherEntity({
    required this.cityName,
    required this.temprature,
    required this.weatherText,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [cityName, temprature, weatherText];
}
