import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

class News extends Equatable {
  final String title, text;

  const News({
    required this.title,
    required this.text,
  });

  // add url and favorite bool in model
  
  //todo add object box annotation in model

  @override
  List<Object?> get props => [title, text];
}
