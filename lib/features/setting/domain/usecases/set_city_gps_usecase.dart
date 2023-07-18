import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/city_repo.dart';

class SetCityByGPSUsecase implements UseCase<bool, NoParams> {
  final CityRepo repo;

  SetCityByGPSUsecase({required this.repo});
  @override
  Future<Either<Failure, bool>> call(params) async {
    return repo.setCityInDatasource();
  }
}
