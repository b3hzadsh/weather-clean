import 'package:test_gradle_files/features/setting/domain/entities/city_geo_entity.dart';

class CityGeoModel extends CityGeoEntity {
  const CityGeoModel({
    required super.cityName,
    required super.longitude,
    required super.latitude,
  });

  @override
  List<Object?> get props => [cityName, latitude, longitude];
}
