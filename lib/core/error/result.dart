import 'failures.dart';

/// Lightweight alternative to `Either<Failure, T>` that avoids third-party deps.
///
/// Repositories return `Future<Result<T>>` — they never throw.
/// Match with exhaustive pattern: `switch (result) { Ok(:final value) => ..., Err(:final failure) => ... }`.
sealed class Result<T> {
  const Result();
}

/// Successful result carrying [value].
final class Ok<T> extends Result<T> {
  const Ok(this.value);

  final T value;
}

/// Failed result carrying a [Failure].
final class Err<T> extends Result<T> {
  const Err(this.failure);

  final Failure failure;
}
