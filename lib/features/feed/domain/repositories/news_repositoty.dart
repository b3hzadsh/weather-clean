import 'package:dartz/dartz.dart';
import 'package:test_gradle_files/features/feed/domain/entities/news.dart';

import '../../../../core/error/failure.dart';

abstract class NewsRepository {
  // [getNewsByTopic] get alot of news by url and mix them 
  // {getNewsByUrl} get all feeds from one url 
  Future<Either<Failure, List<News>>>? getNewsListByTopic(String topic);
  Future<Either<Failure, List<News>>>? getNewsListByUrl(String url);
  Future<Either<Failure, List<News>>>? getFavoriteNewsList();
}
