import 'package:test_gradle_files/features/setting/data/datasources/city_local_datacource.dart';

import 'package:test_gradle_files/core/error/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/features/setting/data/models/city_geo_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/city_repo.dart';

class CityRepoImpl implements CityRepo {
  final CityLocalDataSource cityLocalDataSource;

  CityRepoImpl({required this.cityLocalDataSource});

  @override
  Future<Either<Failure, String>> setCityInDatasource({
    CityGeoModel? cityGeoModel,
  }) async {
    try {
      final success = await cityLocalDataSource.cacheCity(cityGeoModel);
      return right(success);
    } on CacheException catch (_) {
      return left(CacheFailure());
    } on GPSStatusException catch (_) {
      print('object');
      print('object');
      print('object');
      print('object');
      return left(GPSStatusFailure()); // we have no state for this event 
    } on GPSPermissionException catch (_) {
      print('object');
      print('object');
      print('object');
      print('object');
      return left(GPSPermissionFailure());// we have no state for this event
    }
  }
}
