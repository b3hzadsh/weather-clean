import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import 'rss_feed_model.dart';

part 'website_model.g.dart';

@Collection(inheritance: false)
class WebsiteModel extends Equatable {
  Id id = Isar.autoIncrement;
  String? baseUrl;
  String? name;

  final rssFeeds = IsarLinks<RssFeedModel>();

  @override
  @Ignore()
  List<Object?> get props => [name, baseUrl];
}
