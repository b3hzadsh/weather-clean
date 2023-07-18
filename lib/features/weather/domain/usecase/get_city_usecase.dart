import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/features/setting/data/models/city_model.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/weather_repo.dart';

class GetCityUsecase implements UseCase<CityModel, NoParams> {
  final WeatherRepo repo;

  GetCityUsecase({required this.repo});
  @override
  Future<Either<Failure, CityModel>> call(params) async {
    return repo.getCityFromDataSource();
  }
}
