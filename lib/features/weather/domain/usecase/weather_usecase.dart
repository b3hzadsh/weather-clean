import 'package:equatable/equatable.dart';
import 'package:test_gradle_files/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/core/usecase/usecase.dart';

import '../entities/city_temp_entity.dart';
import '../repository/weather_repo.dart';

class WaetherUsecase extends UseCase<WeatherEntity, Params> {
  final WeatherRepo repo;

  WaetherUsecase({required this.repo});
  @override
  Future<Either<Failure, WeatherEntity>> call(Params params) async {
    return repo.getWeatherFromDataSource(params.cityId, params.cityName);
  }
}

class Params extends Equatable {
  final int cityId;
  final String cityName;

  const Params({
    required this.cityId,
    required this.cityName,
  });

  @override
  List<Object?> get props => [cityId];
}
