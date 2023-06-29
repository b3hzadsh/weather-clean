import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/features/setting/data/models/city_geo_model.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/city_repo_impl.dart';

class SetCityManualyUsecase implements UseCase<bool, CityGeoModel> {
  CityRepoImpl repo = CityRepoImpl();
  @override
  Future<Either<Failure, bool>> call(params) async {
    return repo.setCityInDatasource(cityGeoModel: params);
  }
}
