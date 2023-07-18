import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/features/setting/data/models/city_geo_model.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/city_repo.dart';

class SetCityManualyUsecase implements UseCase<bool, CityGeoModel> {
  final CityRepo repo;

  SetCityManualyUsecase({required this.repo});
  @override
  Future<Either<Failure, bool>> call(params) async {
    return repo.setCityInDatasource(cityGeoModel: params);
  }
}
