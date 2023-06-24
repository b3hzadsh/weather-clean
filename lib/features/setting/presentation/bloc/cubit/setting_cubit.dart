import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_gradle_files/core/error/failure.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/usecases/set_city_usecase.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());
  final SetCityByGPSUsecase _setCityUsecase = SetCityByGPSUsecase();
  final String cacheErrorMessage = 'there is a problem with cache';
  final String serverErrorMessage = 'there is a problem with cache';
  final String generalErrorMessage = 'there is a problem with cache';

  void setNewCity() async {
    final failureOrbool = await _setCityUsecase(NoParams());
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
