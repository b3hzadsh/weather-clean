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
  final double temp;

  const ShowTempState(this.temp);
  @override
  // TODO: implement props
  List<Object> get props => [temp];
} 

class ShowErrorState extends GetTempState {} // some thing is wrong
