import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/core/error/failure.dart';

import '../../../setting/data/models/city_model.dart';
import '../entities/city_temp_entity.dart';

abstract class WeatherRepo {
  Future<Either<Failure, WeatherEntity>> getWeatherFromDataSource(int cityID,String cityName);
  Future<Either<Failure, CityModel>> getCityFromDataSource();
}


