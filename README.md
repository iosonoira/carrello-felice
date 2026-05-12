# 🛒 Carrello Leggero

**An intelligent shopping cart application for smart price comparison**

A modern Flutter application designed to help users compare product prices across different stores, track prices, and make informed purchasing decisions. Built with Clean Architecture principles and state-of-the-art Dart/Flutter technologies.

---

## 📋 Project Overview

**carrello_leggero** (lightweight cart) is a multi-platform Flutter application that enables users to:

- **Browse Products**: Explore a wide catalog of products with detailed information
- **Compare Prices**: View prices from different retailers side-by-side
- **Track Prices**: Monitor price changes over time and get alerts
- **Manage Shopping Lists**: Create and organize shopping lists for quick purchases
- **Smart Recommendations**: Get recommendations based on price trends and personal preferences

The application prioritizes **user experience**, **performance**, and **maintainability** through a strict Clean Architecture pattern with Riverpod for state management.

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles with three distinct layers that communicate only with adjacent layers:

```
lib/
├── core/                        # Shared utilities, constants, theme, errors
│   ├── error/                   # Failures and exception handling
│   ├── network/                 # Dio HTTP client with interceptors
│   ├── router/                  # GoRouter navigation configuration
│   └── utils/                   # Helper functions and constants
├── features/                    # Feature modules (independent & scalable)
│   └── <feature_name>/
│       ├── data/                # Data layer - API calls, local storage
│       │   ├── datasources/     # Remote (Dio) and local data access
│       │   ├── dto/             # DTOs with JSON serialization
│       │   └── repositories/    # Repository implementations
│       ├── domain/              # Business logic layer
│       │   ├── entities/        # Core business models
│       │   ├── repositories/    # Abstract repository interfaces
│       │   └── usecases/        # Business logic operations
│       └── presentation/        # UI layer
│           ├── providers/       # Riverpod state providers
│           ├── screens/         # Full-page UI components
│           └── widgets/         # Reusable UI components
└── main.dart                    # Application entry point
```

**Communication Flow**: `presentation` → `domain` → `data`

Never skip layers or import `data` directly from `presentation`.

---

## 🛠️ Tech Stack

| Purpose | Package | Version |
|---------|---------|---------|
| **UI Framework** | Flutter | Latest |
| **Language** | Dart | ^3.11.5 |
| **State Management** | `flutter_riverpod` + `riverpod_annotation` | ^3.3.1 / ^4.0.2 |
| **HTTP Client** | `dio` + `pretty_dio_logger` | ^5.9.2 / ^1.4.0 |
| **Navigation** | `go_router` | ^17.2.3 |
| **Serialization** | `freezed` + `json_serializable` | ^3.2.5 / ^6.13.2 |
| **Annotations** | `freezed_annotation` + `json_annotation` | ^3.1.0 / ^4.11.0 |
| **Image Caching** | `cached_network_image` | ^3.4.1 |
| **Code Generation** | `build_runner` | ^2.15.0 |

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: Latest stable version
- **Dart SDK**: ^3.11.5 or higher
- **IDE**: VS Code, Android Studio, or IntelliJ IDEA (with Flutter plugin)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/carrello_leggero.git
   cd carrello_leggero
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 📱 Development Commands

### Running the Application

```bash
# Run on default device
flutter run

# Run on specific device
flutter run -d <device_id>

# Run in release mode
flutter run --release
```

### Code Generation

Generated files are **committed to the repository** for CI/CD consistency.

```bash
# One-time build
dart run build_runner build --delete-conflicting-outputs

# Watch mode (regenerate on file changes)
dart run build_runner watch --delete-conflicting-outputs

# Clean generated files
dart run build_runner clean
```

### Testing & Quality Assurance

```bash
# Run unit and widget tests
flutter test

# Run tests with coverage report
flutter test --coverage

# Analyze code for issues
flutter analyze

# Format code
dart format lib/
```

---

## 🎯 Key Features & Standards

### Code Generation with Freezed

All **DTOs** and **domain entities** must use `freezed` for immutability:

```dart
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required double price,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
```

### Riverpod State Management

State is managed through Riverpod providers with code generation:

```dart
@riverpod
class ProductNotifier extends _$ProductNotifier {
  @override
  Future<List<Product>> build() async {
    return await _repository.getProducts();
  }
}
```

### Error Handling

Repositories use a typed `Failure` sealed class instead of throwing exceptions:

```dart
sealed class Failure {
  const Failure(this.message);
  final String message;
}

final class NetworkFailure extends Failure { ... }
final class ParseFailure extends Failure { ... }
final class NotFoundFailure extends Failure { ... }
```

### UI Patterns

- **No `GetX`, `setState`, or `BuildContext` in providers**
- **No hardcoded strings** (prepare for i18n)
- **Every `AsyncValue` must handle `.loading`, `.data`, and `.error`**
- **Use `Theme.of(context)` for all styling**
- Use `const` constructors and widgets everywhere possible

---

## 🔄 Feature Development Workflow

When adding a new feature:

1. **Create feature directory** under `lib/features/<feature_name>/`
2. **Start with domain layer**:
   - Define entities in `domain/entities/`
   - Define repository interface in `domain/repositories/`
   - Create use cases in `domain/usecases/`
3. **Implement data layer**:
   - Create DTOs in `data/dto/`
   - Implement datasources in `data/datasources/`
   - Implement repository in `data/repositories/`
4. **Build presentation layer**:
   - Create providers in `presentation/providers/`
   - Build screens in `presentation/screens/`
   - Create reusable widgets in `presentation/widgets/`
5. **Add routing** in `lib/core/router/app_router.dart`
6. **Generate code** and test

---

## 📚 Documentation

- **`CLAUDE.md`** — Detailed development guidelines, architecture rules, and standards
- **`DESIGN.md`** — (forthcoming) UI/UX specifications, color palette, typography
- **Dartdoc comments** (`///`) — Required for all public APIs

---

## 🔒 Code Standards

### Null Safety
- ✅ **Total null safety** — every value must have a type
- ❌ No `!` operator without a comment explaining safety

### Type Safety
- ✅ **Strong typing** — use proper types everywhere
- ❌ No `dynamic` types

### Immutability
- ✅ Use `const` constructors and collections
- ✅ Use `final` for classes
- ✅ Use `sealed` for exhaustive pattern matching

### Logging
- ✅ Use `pretty_dio_logger` for network logs
- ❌ No `print()` statements

---

## 🐛 Debugging & Troubleshooting

### Build Cache Issues
```bash
flutter clean
flutter pub get
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### Analyze Code Issues
```bash
flutter analyze
```

### Hot Reload Not Working
- Try hot restart: `r` in the Flutter CLI
- Or rebuild: `flutter run`

---

## 📦 Project Structure Quick Reference

```
carrello_leggero/
├── lib/
│   ├── core/                # Shared code
│   ├── features/            # Feature modules
│   └── main.dart            # App entry point
├── test/                    # Unit and widget tests
├── ios/                     # iOS native code
├── android/                 # Android native code
├── web/                     # Web platform support
├── CLAUDE.md               # Development standards
├── pubspec.yaml            # Dependencies
└── README.md               # This file
```

---

## 🤝 Contributing

When contributing to this project:

1. Follow the **Clean Architecture** pattern strictly
2. Run `flutter analyze` and ensure no warnings
3. Use `dart format` for code formatting
4. Add tests for new features
5. Update `CLAUDE.md` if standards change
6. Generate code after modifying annotated files

---

## 📄 License

This project is proprietary. Unauthorized use or distribution is prohibited.

---

## 👨‍💻 Author

**Matteo Dessi** — matteo.dessi93@gmail.com

---

## 📞 Support

For issues, questions, or suggestions, please refer to the project documentation or contact the development team.
