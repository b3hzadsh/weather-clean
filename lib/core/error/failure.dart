import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class GPSPermissionFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GPSStatusFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GeneralFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
