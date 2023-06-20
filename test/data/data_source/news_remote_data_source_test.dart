import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_gradle_files/core/error/failure.dart';
import 'package:test_gradle_files/features/feed/data/datasources/news_remote_data_source.dart';
import 'package:test_gradle_files/features/feed/domain/entities/news.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  NewsRemoteDataSourceImp nrdi = NewsRemoteDataSourceImp();

  test(
    "test the url getting news ",
    () async {
      // arrang
      String rssUrl = 'farsnews.ir/rss';

      // act
      var result = nrdi.getNewsListByUrl(rssUrl);

      // assert
      expect(result, TypeMatcher<Future<Either<Failure, List<News>>>>());
      // expect(result, leng);
    },
  );
}
