import 'package:test_gradle_files/features/setting/data/datasources/city_local_datacource.dart';

import 'package:test_gradle_files/core/error/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/features/setting/data/models/city_geo_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/city_repo.dart';

class CityRepoImpl implements CityRepo {
  CityLocalDataSourceImpl cityLocalDataSourceImpl = CityLocalDataSourceImpl();

  @override
  Future<Either<Failure, bool>> setCityInDatasource({
    CityGeoModel? cityGeoModel,
  }) async {
    try {
      final success = await cityLocalDataSourceImpl.cacheCity(cityGeoModel);
      return right(success);
    } on CacheException catch (_) {
      return left(CacheFailure());
    }
  }
}
