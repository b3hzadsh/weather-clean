import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_gradle_files/core/error/failure.dart';
import 'package:test_gradle_files/core/usecase/usecase.dart';
import 'package:test_gradle_files/features/feed/domain/entities/news.dart';
import 'package:test_gradle_files/features/feed/domain/repositories/news_repositoty.dart';

class GetNewsByTopic implements UseCase<List<News>, Params> {
  final NewsRepository repository;

  GetNewsByTopic(this.repository);

  @override
  Future<Either<Failure, List<News>>?> call(Params params) async {
    return repository.getNewsListByTopic(params.topic);
  }
}

class Params extends Equatable {
  final String topic;

  const Params({required this.topic});

  @override
  List<Object?> get props => [topic];
}
