import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_gradle_files/core/error/failure.dart';
import 'package:test_gradle_files/features/setting/data/models/city_geo_model.dart';
import 'package:test_gradle_files/features/setting/domain/usecases/set_city_manualy.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/usecases/set_city_gps_usecase.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({
    required this.setCityUsecase,
    required this.setCityManualyUsecase,
  }) : super(SettingInitial());

  final SetCityByGPSUsecase setCityUsecase;
  final SetCityManualyUsecase setCityManualyUsecase;

  final String cacheErrorMessage = 'There is a problem with cache';
  final String serverErrorMessage = 'Server is not responding';
  final String generalErrorMessage = 'There is a problem in some where';

  void setNewCityByGPS() async {
    final failureOrbool = await setCityUsecase(NoParams());
    failureOrbool.fold(
      (l) {
        if (l is CacheFailure) {
          emit(SettingStateFailed(cacheErrorMessage));
        } else if (l is ServerFailure) {
          emit(SettingStateFailed(serverErrorMessage));
        } else {
          emit(SettingStateFailed(generalErrorMessage));
        }
      },
      (r) => emit(SettingStateSuccess()),
    );
  }

  void setNewCityManualy(CityGeoModel cityGeoModel) async {
    final failureOrbool = await setCityManualyUsecase(cityGeoModel);
    failureOrbool.fold(
      (l) {
        if (l is CacheFailure) {
          emit(SettingStateFailed(cacheErrorMessage));
        } else if (l is ServerFailure) {
          emit(SettingStateFailed(serverErrorMessage));
        } else {
          emit(SettingStateFailed(generalErrorMessage));
        }
      },
      (r) => emit(SettingStateSuccess()),
    );
  }
}
