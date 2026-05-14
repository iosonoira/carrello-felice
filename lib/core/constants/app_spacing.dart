/// Application spacing scale based on DESIGN.md design tokens.
/// Follows an 8px linear scale for mathematical harmony.
abstract final class AppSpacing {
  // Base spacing scale (8px increments)
  static const double base = 8.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  // Layout constants
  static const double containerMax = 1200.0;
  static const double gutter = 16.0;
  static const double marginMobile = 16.0;
  static const double marginDesktop = 40.0;

  // Stack spacing variants (vertical spacing)
  static const double stackSm = 8.0;
  static const double stackMd = 16.0;
  static const double stackLg = 24.0;
}

/// Corner radius constants based on DESIGN.md design tokens.
abstract final class AppRadius {
  static const double sm = 4.0; // 0.25rem
  static const double none = 8.0; // 0.5rem (default)
  static const double md = 12.0; // 0.75rem
  static const double lg = 16.0; // 1rem
  static const double xl = 24.0; // 1.5rem
  static const double full = 9999.0; // 9999px
}
