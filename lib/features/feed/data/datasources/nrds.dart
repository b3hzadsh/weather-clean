import 'package:test_gradle_files/features/feed/data/datasources/news_remote_data_source.dart';

void main() {
  NewsRemoteDataSourceImp nrdi = NewsRemoteDataSourceImp();
  String rssUrl = 'farsnews.ir/rss';

  var result = nrdi.getNewsListByUrl(rssUrl);

  // expect(result, TypeMatcher<Future<Either<Failure, List<News>>>>());
}
