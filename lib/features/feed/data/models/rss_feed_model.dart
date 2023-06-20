import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import 'news_model.dart';
import 'website_model.dart';

part 'rss_feed_model.g.dart';

@Collection(inheritance: false)
class RssFeedModel extends Equatable {
  Id id = Isar.autoIncrement;

  String? url;

  @Backlink(to: "rssFeeds")
  final website = IsarLink<WebsiteModel>();

  @Backlink(to: "rssFeed")
  final news = IsarLinks<NewsModel>();

  @override
  @Ignore()
  List<Object?> get props => [website, url];
}
