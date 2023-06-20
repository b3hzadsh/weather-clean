import 'package:equatable/equatable.dart';

class Website extends Equatable {
  final String baseUrl;
  final String name;

  const Website(this.baseUrl, this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [name, baseUrl];
}
