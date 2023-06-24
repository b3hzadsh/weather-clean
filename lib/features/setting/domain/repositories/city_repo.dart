import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/city_entity.dart';

abstract class CityRepo {
  Future<Either<Failure, CityEntity>> getCityFromDatasource();
  Future<Either<Failure, bool>> setCityInDatasource();
}