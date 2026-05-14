// Data-layer exceptions thrown by datasources.
// Datasources throw these; repositories catch them and return Failure types.
// Never let these propagate past the repository boundary.

/// Thrown when an HTTP request fails (network error, timeout, 4xx/5xx).
final class NetworkException implements Exception {
  const NetworkException(this.message, {this.statusCode});

  final String message;

  /// HTTP status code, if available.
  final int? statusCode;

  @override
  String toString() => 'NetworkException($statusCode): $message';
}

/// Thrown when JSON decoding or model mapping fails.
final class ParseException implements Exception {
  const ParseException(this.message);

  final String message;

  @override
  String toString() => 'ParseException: $message';
}

/// Thrown when a local cache operation (read or write) fails.
final class CacheException implements Exception {
  const CacheException(this.message);

  final String message;

  @override
  String toString() => 'CacheException: $message';
}

/// Thrown when a requested resource cannot be found.
final class NotFoundException implements Exception {
  const NotFoundException(this.message);

  final String message;

  @override
  String toString() => 'NotFoundException: $message';
}
