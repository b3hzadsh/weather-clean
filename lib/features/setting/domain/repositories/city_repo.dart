import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/features/setting/data/models/city_geo_model.dart';

import '../../../../core/error/failure.dart';

abstract class CityRepo {
  Future<Either<Failure, bool>> setCityInDatasource({CityGeoModel? cityGeoModel});
  // Future<Either<Failure, bool>> setCityInDatasource();
}