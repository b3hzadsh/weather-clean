part of 'get_temp_cubit.dart';

abstract class GetTempState extends Equatable {
  const GetTempState();

  @override
  List<Object> get props => [];
}

class GetTempInitial extends GetTempState {} // press to update temp

class MainCityState extends GetTempState {
  final String cityName;

  const MainCityState(this.cityName);
  List<Object> get props => [cityName];
} // press to update temp

class LoadingState extends GetTempState {} // indicator

class ShowTempState extends GetTempState {
  final WeatherEntity cityTempEntity;

  const ShowTempState(this.cityTempEntity);
  @override
  List<Object> get props =>
      [cityTempEntity, cityTempEntity.cityName, cityTempEntity.temprature];
}

class ShowErrorState extends GetTempState {
  final String errorMessage;

  const ShowErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
} // some thing is wrong
