import 'package:equatable/equatable.dart';

class CityGeoEntity extends Equatable {
  final String cityName;
  final double longitude, latitude;

  const CityGeoEntity({
    required this.cityName,
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object?> get props => [cityName, latitude, longitude];
}
