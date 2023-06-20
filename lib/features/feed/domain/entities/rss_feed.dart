import 'package:equatable/equatable.dart';
import 'package:test_gradle_files/features/feed/domain/entities/website.dart';

class RssFeed extends Equatable {
  final Website website;
  final String url;
  const RssFeed(this.website, this.url);

  @override
  // TODO: implement props
  List<Object?> get props => [website, url];
}
