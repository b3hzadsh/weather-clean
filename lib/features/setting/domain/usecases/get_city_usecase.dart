import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/city_repo_impl.dart';
import '../entities/city_entity.dart';

class GetCityUsecase implements UseCase<CityEntity, NoParams> {
  CityRepoImpl repo = CityRepoImpl();
  @override
  Future<Either<Failure, CityEntity>> call(params) async {
    return repo.getCityFromDatasource();
  }
}
