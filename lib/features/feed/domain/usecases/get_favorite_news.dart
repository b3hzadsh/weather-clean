import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/core/error/failure.dart';
import 'package:test_gradle_files/core/usecase/usecase.dart';
import 'package:test_gradle_files/features/feed/domain/entities/news.dart';
import 'package:test_gradle_files/features/feed/domain/repositories/news_repositoty.dart';

class GetFavoriteNews implements UseCase<List<News>, NoParams> {
  final NewsRepository repository;

  GetFavoriteNews(this.repository);

  @override
  Future<Either<Failure, List<News>>?> call(NoParams noParams) async {
    return repository.getFavoriteNewsList();
  }
}
