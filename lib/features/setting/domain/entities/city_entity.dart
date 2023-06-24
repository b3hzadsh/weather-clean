import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final String cityName;
  final int cityId;

  const CityEntity({required this.cityName, required this.cityId});

  @override
  List<Object?> get props => [cityName, cityId];
}
