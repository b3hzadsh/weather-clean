import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_gradle_files/core/error/failure.dart';
import 'package:test_gradle_files/core/usecase/usecase.dart';
import 'package:test_gradle_files/features/feed/domain/entities/news.dart';
import 'package:test_gradle_files/features/feed/domain/repositories/news_repositoty.dart';

class GetNewsByUrl implements UseCase<List<News>, Params> {
  final NewsRepository repository;
  
  GetNewsByUrl(this.repository);

  @override
  Future<Either<Failure, List<News>>?> call(Params params) async {
    return repository.getNewsListByUrl(params.url);
  }
}

class Params extends Equatable {
  final String url;

  const Params({required this.url});

  @override
  List<Object?> get props => [url];
}
