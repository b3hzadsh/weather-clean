part of 'setting_cubit.dart';

abstract class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

class SettingInitial extends SettingState {}

class SettingStateSuccess extends SettingState {}

class SettingStateFailed extends SettingState {
  final String errorMessage;

  const SettingStateFailed(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
