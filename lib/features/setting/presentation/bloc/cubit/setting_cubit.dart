import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_gradle_files/core/error/failure.dart';
import 'package:test_gradle_files/features/setting/data/models/city_geo_model.dart';
import 'package:test_gradle_files/features/setting/domain/usecases/set_city_manualy.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/usecases/set_city_gps_usecase.dart';

part 'setting_state.dart';
///! add loading state and emit and react to it 

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({
    required this.setCityUsecase,
    required this.setCityManualyUsecase,
  }) : super(const SettingInitial(cityName: ''));

  final SetCityByGPSUsecase setCityUsecase;
  final SetCityManualyUsecase setCityManualyUsecase;

  final String gpsPermissionErrorMessage = 'GPS permission is denied, please give app gps permission';
  final String gpsStatusErrorMessage = 'GPS is off, please turn it on';
  final String cacheErrorMessage = 'There is a problem with cache';
  final String serverErrorMessage = 'Server is not responding';
  final String generalErrorMessage = 'There is a problem in some where';

  void setNewCityByGPS() async {
    emit(SettingStateLoading());
    final failureOrString = await setCityUsecase(NoParams());
    failureOrString.fold(
      (l) {
        if (l is CacheFailure) {
          emit(SettingStateFailed(cacheErrorMessage));
        } else if (l is ServerFailure) {
          emit(SettingStateFailed(serverErrorMessage));
        }else if (l is GPSPermissionFailure){
          emit(SettingStateFailed(gpsPermissionErrorMessage));
        }else if (l is GPSStatusFailure){
          emit(SettingStateFailed(gpsStatusErrorMessage));
        }
         else {
          emit(SettingStateFailed(generalErrorMessage));
        }
      },
      (r) => emit(SettingStateSuccess(cityName: r)),
    );
  }

  void setNewCityManualy(CityGeoModel cityGeoModel) async {
    emit(SettingStateLoading());
    final failureOrString = await setCityManualyUsecase(cityGeoModel);
    failureOrString.fold(
      (l) {
        if (l is CacheFailure) {
          emit(SettingStateFailed(cacheErrorMessage));
        } else if (l is ServerFailure) {
          emit(SettingStateFailed(serverErrorMessage));
        } else {
          emit(SettingStateFailed(generalErrorMessage));
        }
      },
      (r) => emit(SettingStateSuccess(cityName: r)),
    );
  }
}
