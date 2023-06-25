import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/features/setting/data/models/city_model.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repository/wheather_repo_impl.dart';

class GetCityUsecase implements UseCase<CityModel, NoParams> {
  WeatherRepoImpl repo = WeatherRepoImpl();
  @override
  Future<Either<Failure, CityModel>> call(params) async {
    return repo.getCityFromDataSource();
  }
}
