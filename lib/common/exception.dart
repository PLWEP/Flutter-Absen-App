class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() => message;
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);

  @override
  String toString() => message;
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);

  @override
  String toString() => message;
}
