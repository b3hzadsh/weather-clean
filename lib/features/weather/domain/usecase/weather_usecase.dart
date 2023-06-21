import 'package:test_gradle_files/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/core/usecase/usecase.dart';
import 'package:test_gradle_files/features/weather/data/repository/wheather_repo_impl.dart';

import '../entities/city_temp_entity.dart';

class WaetherUsecase extends UseCase {
  WeatherRepoImpl repo = WeatherRepoImpl();
  @override
  Future<Either<Failure, WeatherEntity>> call(params) async {
    return repo.getWeatherFromDataSource();
  }
}
