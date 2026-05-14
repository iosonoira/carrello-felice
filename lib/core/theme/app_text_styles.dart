import 'package:flutter/material.dart';

/// Typography tokens from DESIGN.md.
///
/// All [letterSpacing] values are converted from em to logical pixels
/// (e.g. 0.05em at 14px = 0.7px) because Flutter uses logical pixels, not em.
abstract final class AppTextStyles {
  /// headline-lg: 32px w700, −0.02em → −0.64px
  static const TextStyle headlineLg = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.25,
    letterSpacing: -0.64,
  );

  /// headline-lg-mobile: 28px w700, −0.01em → −0.28px
  static const TextStyle headlineLgMobile = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.286,
    letterSpacing: -0.28,
  );

  /// headline-md: 24px w600
  static const TextStyle headlineMd = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.333,
  );

  /// headline-sm: 20px w600
  static const TextStyle headlineSm = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  /// body-lg: 18px w400
  static const TextStyle bodyLg = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.556,
  );

  /// body-md: 16px w400
  static const TextStyle bodyMd = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  /// label-md: 14px w600, 0.05em → 0.7px
  static const TextStyle labelMd = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.429,
    letterSpacing: 0.7,
  );

  /// label-sm: 12px w500
  static const TextStyle labelSm = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.333,
  );
}
