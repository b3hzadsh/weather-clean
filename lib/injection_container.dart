import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/servises/internet_service.dart';
import 'core/servises/location_service.dart';
import 'core/servises/permission_service.dart';
import 'core/servises/sh_pref_service.dart';
import 'core/servises/theme_service.dart';
import 'core/servises/weather_service.dart';
import 'features/setting/data/datasources/city_local_datacource.dart';
import 'features/setting/data/repositories/city_repo_impl.dart';
import 'features/setting/domain/repositories/city_repo.dart';
import 'features/setting/domain/usecases/set_city_gps_usecase.dart';
import 'features/setting/domain/usecases/set_city_manualy.dart';
import 'features/setting/presentation/bloc/cubit/setting_cubit.dart';
import 'features/weather/data/datasource/local_datasource.dart';
import 'features/weather/data/datasource/remote_datasource.dart';
import 'features/weather/data/repository/wheather_repo_impl.dart';
import 'features/weather/domain/repository/weather_repo.dart';
import 'features/weather/domain/usecase/get_city_usecase.dart';
import 'features/weather/domain/usecase/weather_usecase.dart';
import 'features/weather/presentation/pages/home_page/cubit/get_temp_cubit.dart';

final sl = GetIt.I; // sl == Service Locator

Future<void> init() async {
// ! application Layer
  // Factory = every time a new/fresh instance of that class
  sl.registerFactory<GetTempCubit>(
    () => GetTempCubit(
      getCityUsecase: sl(),
      weatherUsecase: sl(),
    ),
  );
  sl.registerFactory<SettingCubit>(
    () => SettingCubit(
      setCityManualyUsecase: sl(),
      setCityUsecase: sl(),
    ),
  );

// ! domain Layer
  sl.registerFactory<WaetherUsecase>(() => WaetherUsecase(repo: sl()));
  sl.registerFactory<GetCityUsecase>(() => GetCityUsecase(repo: sl()));
  sl.registerFactory<SetCityByGPSUsecase>(
    () => SetCityByGPSUsecase(repo: sl()),
  );
  sl.registerFactory<SetCityManualyUsecase>(
    () => SetCityManualyUsecase(repo: sl()),
  );

// ! data Layer
  sl.registerFactory<WeatherRepo>(
    () => WeatherRepoImpl(
      weatherLocalDatasource: sl(),
      weatherRemoteDataSource: sl(),
    ),
  );
  sl.registerFactory<CityRepo>(
    () => CityRepoImpl(
      cityLocalDataSource: sl(),
    ),
  );
  sl.registerFactory<WeatherLocalDataSource>(
    () => WeatherLocalDataSourceImp(
      client: sl(),
      sharedPref: sl(),
      weatherService: sl(),
    ),
  );
  sl.registerFactory<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImp(
      client: sl(),
      weatherService: sl(),
    ),
  );
  sl.registerFactory<CityLocalDataSource>(
    () => CityLocalDataSourceImpl(
      client: sl(),
      sharedPref: sl(),
      internetService: sl(),
      locationHelper: sl(),
      permissionHelper: sl(),
    ),
  );

// ! externs
  sl.registerFactory<http.Client>(() => http.Client());
  sl.registerFactory<ThemeService>(() => ThemeService());
  sl.registerFactory<WeatherService>(() => WeatherService());
  sl.registerLazySingleton<SharedPref>(() => SharedPref());
  sl.registerFactory<InternetService>(() => InternetService());
  sl.registerFactory<LocationHelper>(() => LocationHelper());
  sl.registerFactory<PermissionHelper>(() => PermissionHelper());
}
