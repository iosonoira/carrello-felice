/// Domain-layer error types returned by repositories.
///
/// Repositories never throw — they return a [Failure] subtype.
/// Use exhaustive pattern matching on [Failure] in use cases and providers.
sealed class Failure {
  const Failure(this.message);

  /// Human-readable description of what went wrong.
  final String message;
}

/// HTTP / connectivity error (no internet, timeout, 5xx).
final class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Response received but could not be decoded into the expected model.
final class ParseFailure extends Failure {
  const ParseFailure(super.message);
}

/// Requested resource does not exist (404 or empty result).
final class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

/// Local cache read/write error.
final class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Catch-all for unexpected errors. Wraps the original [error].
final class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message, {this.error});

  /// Original exception, if available.
  final Object? error;
}
