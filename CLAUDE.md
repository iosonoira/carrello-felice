# SmartPrice — carrello_leggero

Flutter app for smart price comparison. Dart 3+ / Clean Architecture / Riverpod.

---

## Commands

```bash
# Run the app
flutter run

# Generate code (freezed, json_serializable, riverpod)
dart run build_runner build --delete-conflicting-outputs

# Watch mode during development
dart run build_runner watch --delete-conflicting-outputs

# Analyze
flutter analyze

# Tests
flutter test

# Tests with coverage
flutter test --coverage
```

---

## Architecture

Strict Clean Architecture. Each layer communicates **only with the adjacent one**.

```
lib/
├── core/                        # Shared utilities, constants, theme, errors
│   ├── error/                   # Failures, exceptions
│   ├── network/                 # Dio client + interceptors
│   └── utils/
├── features/
│   └── <feature_name>/
│       ├── data/
│       │   ├── datasources/     # Remote (Dio) and local datasources
│       │   ├── dto/             # DTOs — json_serializable + freezed
│       │   └── repositories/   # Repository implementations
│       ├── domain/
│       │   ├── entities/        # Pure Dart models — freezed
│       │   ├── repositories/    # Abstract repository interfaces
│       │   └── usecases/        # One class, one public method
│       └── presentation/
│           ├── providers/       # Riverpod providers (@riverpod generator)
│           ├── screens/
│           └── widgets/
└── main.dart
```

**Rule:** `presentation` → `domain` → `data`. Never skip layers. Never import `data` from `presentation`.

---

## Stack

| Concern | Package | Version |
|---|---|---|
| State Management | `flutter_riverpod` + `riverpod_annotation` | ^3.3.1 / ^4.0.2 |
| Networking | `dio` + `pretty_dio_logger` | ^5.9.2 / ^1.4.0 |
| Routing | `go_router` | ^17.2.3 |
| Immutability + Serialization | `freezed` + `freezed_annotation` + `json_annotation` | ^3.2.5 / ^3.1.0 / ^4.11.0 |
| Image caching | `cached_network_image` | ^3.4.1 |
| Code generation | `build_runner` + `json_serializable` | ^2.15.0 / ^6.13.2 |

**Do not add packages outside this list without explicit approval.**

---

## Dart & Flutter Standards

- **Dart SDK:** `^3.11.5` — use Records, Pattern Matching, sealed/final/base class modifiers.
- **Null Safety:** total. No `!` operator without a comment explaining why it is safe.
- **No `dynamic`:** ever. Every value must have a strong type.
- **`const`:** use everywhere possible — constructors, widgets, lists.
- **Class modifiers:** use `sealed` for exhaustive pattern matching on domain states, `final` for DTOs and entities, `base` where inheritance must be controlled.
- **Providers:** always use `@riverpod` code generation. No manual `Provider(...)` instantiation.
- **Error handling:** every `AsyncValue` in the UI must handle `.loading`, `.data`, and `.error` explicitly. No silent catches.

---

## Code Generation

Every DTO and domain entity must use `freezed`. Run build_runner after any change to annotated files.

```dart
// ✅ Correct DTO pattern
@freezed
class ProductDto with _$ProductDto {
  const factory ProductDto({
    required String id,
    required String name,
    required double price,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
```

Generated files (`*.freezed.dart`, `*.g.dart`) are committed to the repository.

---

## Routing

All routes are declared in `lib/core/router/app_router.dart` using GoRouter with **typed routes**. No `context.go('/raw-string')` outside of the router file.

---

## Error Handling Pattern

Use a `Failure` sealed class in `core/error/`. Repositories never throw — they return `Either<Failure, T>` or expose `AsyncValue<T>` via Riverpod.

```dart
// ✅ Repository always returns a typed result
sealed class Failure {
  const Failure(this.message);
  final String message;
}
final class NetworkFailure extends Failure { ... }
final class ParseFailure extends Failure { ... }
final class NotFoundFailure extends Failure { ... }
```

---

## Documentation

- Public classes, methods, and providers must have `dartdoc` comments (`///`).
- Complex business logic requires inline explanation of *why*, not *what*.
- If you add logic without a comment and it is non-trivial, flag it.

---

## Design Reference

> ⚠️ `DESIGN.md` has not been created yet — it will be added to the project root.
>
> When it exists, read it before making any UI or theming decision. It will define:
> - Color palette and typography tokens
> - Component visual specifications
> - Spacing and layout rules
> - Dark/light mode strategy
>
> Until `DESIGN.md` is present, do not hardcode colors or text styles. Use `Theme.of(context)` exclusively.

---

## Critical Rules

- **No `GetX`.** No `setState` in feature screens. No `BuildContext` inside providers.
- **No hardcoded strings** for user-facing text (prepare for i18n from day one).
- **No `print()`** — use `pretty_dio_logger` for network and structured logging elsewhere.
- **No skipping error states in the UI.** Every `AsyncNotifierProvider` must expose loading and error.
- When compacting, preserve: list of modified files, pending build_runner runs, and current failing tests.
