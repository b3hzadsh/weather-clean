class ServerException implements Exception {
  String? text;
  ServerException({this.text});
}

class CacheException implements Exception {}
class GPSPermissionException implements Exception {}
class GPSStatusException implements Exception {}
