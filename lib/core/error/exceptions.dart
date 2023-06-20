class ServerException implements Exception {
  String? text;
  ServerException({this.text});
}

class CacheException implements Exception {}
