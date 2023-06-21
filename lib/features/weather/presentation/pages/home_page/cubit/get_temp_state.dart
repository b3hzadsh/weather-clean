part of 'get_temp_cubit.dart';

abstract class GetTempState extends Equatable {
  const GetTempState();

  @override
  List<Object> get props => [];
}

class GetTempInitial extends GetTempState {} // press to update temp

class LoadingState extends GetTempState {} // indicator

class ShowTempState extends GetTempState {
  /// show the temp
  final WeatherEntity cityTempEntity;

  const ShowTempState(this.cityTempEntity);
  @override
  // TODO: implement props
  List<Object> get props => [cityTempEntity];
}

class ShowErrorState extends GetTempState {
  final String errorMessage;

  ShowErrorState(this.errorMessage);

  List<Object> get props => [errorMessage];
} // some thing is wrong
