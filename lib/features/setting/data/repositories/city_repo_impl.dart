import 'package:test_gradle_files/features/setting/data/datasources/city_local_datacource.dart';
import 'package:test_gradle_files/features/setting/domain/entities/city_entity.dart';

import 'package:test_gradle_files/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/city_repo.dart';

class CityRepoImpl implements CityRepo {
  CityLocalDataSourceImpl cityLocalDataSourceImpl = CityLocalDataSourceImpl();
  @override
  Future<Either<Failure, CityEntity>> getCityFromDatasource() async {
    try {
      final result = await cityLocalDataSourceImpl.getCurrentCity();
      return right(result);
    } on CacheException catch (_) {
      return left(CacheFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setCityInDatasource() async {
    try {
      final success = await cityLocalDataSourceImpl.cacheCity();
      return right(success);
    } on CacheException catch (_) {
      return left(CacheFailure());
    }
  }
}
