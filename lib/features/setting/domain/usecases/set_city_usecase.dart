import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/city_repo_impl.dart';

class SetCityByGPSUsecase implements UseCase<bool, NoParams> {
  CityRepoImpl repo = CityRepoImpl();
  @override
  Future<Either<Failure, bool>> call(params) async {
    return repo.setCityInDatasource();
  }
}
