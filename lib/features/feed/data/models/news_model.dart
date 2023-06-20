// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import 'rss_feed_model.dart';

part 'news_model.g.dart';

@Collection(inheritance: false)
class NewsModel extends Equatable {
  Id id = Isar.autoIncrement;

  String? text;
  String? title;
  bool? favorite;

  final rssFeed = IsarLink<RssFeedModel>();

  NewsModel({this.text, this.title, this.favorite = false});
  // NewsModel({required super.text,required super.title});
  // NewsModel({
  //   this.id = 0,
  //   this.favorite = false,
  //   required super.title,
  //   required super.text,
  // });
  factory NewsModel.fromJson(Map json) {
    return NewsModel(
      text: json['text'],
      title: json['title'],
    );
  }
  
 
  @override
  @Ignore()
  List<Object?> get props => [text, title];
}
