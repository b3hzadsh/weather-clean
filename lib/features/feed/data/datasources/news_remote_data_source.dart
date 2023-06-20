// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:test_gradle_files/core/error/exceptions.dart';
import 'package:test_gradle_files/core/error/failure.dart';
import 'package:test_gradle_files/core/network/split_url.dart';
import 'package:test_gradle_files/features/feed/domain/entities/news.dart';
import 'dart:async';

abstract class NewsRemoteDataSource {
  // [getNewsByTopic] get alot of news by url and mix them
  // {getNewsByUrl} get all feeds from one url
  Future<Either<Failure, List<News>>>? getNewsListByTopic(String topic);
  Future<Either<Failure, List<News>>>? getNewsListByUrl(String url);
  // Future<Either<Failure, List<News>>>? getFavoriteNewsList();
}

class NewsRemoteDataSourceImp implements NewsRemoteDataSource {
  @override
  Future<Either<Failure, List<News>>>? getNewsListByTopic(String topic) {
    // TODO: implement getNewsListByTopic
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<News>>>? getNewsListByUrl(String url) async {
    List<News> result = [];
    Map splitUrl = UrlSplitter.splitter(url);
    final http.Client client = http.Client();
    Uri urlUri = Uri.http(
      splitUrl['authority'],
      splitUrl['unencodedPath'],
    );
    await client.get(urlUri).then(
      (response) {
        if (response.statusCode == 200) {
          return response.body;
        }
        throw ServerException();
      },
    ).then((bodyString) {
      try {
        var channel = RssFeed.parse(bodyString);
        if (channel.items.isNotEmpty) {
          for(var item in channel.items ){
            result.add(
              News(
                title: item.title ?? '',
                text: item.description ?? '',
              ),
            );
          }
        }
      } catch (e) {
        throw ServerException(
          text: 'cant parse the rss link. link is invalid bro',
        );
      }
    });

    return Right(result);
  }
}
