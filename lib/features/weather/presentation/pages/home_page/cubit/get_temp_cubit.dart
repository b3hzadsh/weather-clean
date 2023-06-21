import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_gradle_files/core/error/failure.dart';
import 'package:test_gradle_files/core/usecase/usecase.dart';

import '../../../../domain/entities/city_temp_entity.dart';
import '../../../../domain/usecase/weather_usecase.dart';

part 'get_temp_state.dart';

const generalFailureMessage = 'Ups, something gone wrong. Please try again!';
const serverFailureMessage = 'Ups, API Error. please try again!';
const cacheFailureMessage = 'Ups, chache failed. Please try again!';

class GetTempCubit extends Cubit<GetTempState> {
  GetTempCubit() : super(GetTempInitial());
  final WaetherUsecase _usecase = WaetherUsecase();

  void adviceRequested() async {
    emit(LoadingState());
    final failureOrCte = await _usecase(NoParams());
    failureOrCte.fold(
      (failure) => emit(ShowErrorState(_mapFaliureToMessage(failure))),
      (cte) => emit(ShowTempState(cte)),
    );
  }

  _mapFaliureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'server error';
      case CacheFailure:
        return 'cache error';
      case GeneralFailure:
        return 'some thing is wrong';
      default:
    }
  }
}
