import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/features/weather/domain/entities/city_temp_entity.dart';
import 'package:test_gradle_files/core/error/failure.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repository/weather_repo.dart';
import '../datasource/remote_datasource.dart';

class WeatherRepoImpl implements WeatherRepo {
  WeatherRepoImpl();
  final WeatherRemoteDataSourceImp weatherRemoteDataSource = WeatherRemoteDataSourceImp();

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherFromDataSource(int cityID,String cityName) async {
    try {
      final result = await weatherRemoteDataSource.getWeatherFromApi(cityID,cityName);
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
