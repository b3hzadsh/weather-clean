import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_gradle_files/core/error/failure.dart';
import 'package:test_gradle_files/core/usecase/usecase.dart';

import '../../../../domain/entities/city_temp_entity.dart';
import '../../../../domain/usecase/get_city_usecase.dart';
import '../../../../domain/usecase/weather_usecase.dart';

part 'get_temp_state.dart';

const generalFailureMessage = 'Ups, something gone wrong. Please try again!';
const serverFailureMessage = 'Ups, API Error. please try again!';
const cacheFailureMessage = 'Ups, chache failed. Please try again!';

class GetTempCubit extends Cubit<GetTempState> {
  GetTempCubit({
    required this.weatherUsecase,
    required this.getCityUsecase,
  }) : super(GetTempInitial());
  final WaetherUsecase weatherUsecase;
  final GetCityUsecase getCityUsecase;

  void setMainCity() async {
    final failureOrCity = await getCityUsecase(NoParams());
    failureOrCity.fold(
      (failure) {
        emit(GetTempInitial());
      },
      (cityModel) async {
        final String cityName = cityModel.cityName;
        emit(MainCityState(cityName));
      },
    );
  }

  void updateWeather() async {
    emit(LoadingState());
    //* check for how the last city saved
    final failureOrCity = await getCityUsecase(NoParams());
    failureOrCity.fold(
      (failure) {
        emit(ShowErrorState(_mapFaliureToMessage(failure)));
      },
      (cityModel) async {
        final failureOrCte = await weatherUsecase(
          Params(
            cityId: cityModel.cityId,
            cityName: cityModel.cityName,
          ),
        );
        failureOrCte.fold(
          (failure) => emit(ShowErrorState(_mapFaliureToMessage(failure))),
          (cityModel) => emit(ShowTempState(cityModel)),
        );
      },
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
