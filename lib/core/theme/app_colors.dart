import 'package:flutter/material.dart';

/// Application color palette based on DESIGN.md design tokens.
/// All colors follow the "EcoPrice" theme with a naturalist green hierarchy.
abstract final class AppColors {
  // Surface Colors
  static const Color surface = Color(0xFFF8F9FA);
  static const Color surfaceDim = Color(0xFFD9DADB);
  static const Color surfaceBright = Color(0xFFF8F9FA);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF3F4F5);
  static const Color surfaceContainer = Color(0xFFEDEEEF);
  static const Color surfaceContainerHigh = Color(0xFFE7E8E9);
  static const Color surfaceContainerHighest = Color(0xFFE1E3E4);
  static const Color surfaceVariant = Color(0xFFE1E3E4);
  static const Color background = Color(0xFFF8F9FA);

  // On Surface Colors
  static const Color onSurface = Color(0xFF191C1D);
  static const Color onSurfaceVariant = Color(0xFF3D4A42);
  static const Color onBackground = Color(0xFF191C1D);

  // Inverse Surface Colors
  static const Color inverseSurface = Color(0xFF2E3132);
  static const Color inverseOnSurface = Color(0xFFF0F1F2);
  static const Color inversePrimary = Color(0xFF68DBA9);

  // Outline Colors
  static const Color outline = Color(0xFF6D7A72);
  static const Color outlineVariant = Color(0xFFBCCAC0);

  // Primary Colors (Emerald)
  static const Color primary = Color(0xFF006948);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF00855D);
  static const Color onPrimaryContainer = Color(0xFFF5FFF7);
  static const Color primaryFixed = Color(0xFF85F8C4);
  static const Color primaryFixedDim = Color(0xFF68DBA9);
  static const Color onPrimaryFixed = Color(0xFF002114);
  static const Color onPrimaryFixedVariant = Color(0xFF005137);

  // Secondary Colors (Sage)
  static const Color secondary = Color(0xFF43664D);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFC2E9C9);
  static const Color onSecondaryContainer = Color(0xFF486A51);
  static const Color secondaryFixed = Color(0xFFC5ECCC);
  static const Color secondaryFixedDim = Color(0xFFAAD0B1);
  static const Color onSecondaryFixed = Color(0xFF00210E);
  static const Color onSecondaryFixedVariant = Color(0xFF2C4E36);

  // Tertiary Colors (Mint)
  static const Color tertiary = Color(0xFF3F6353);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFF577C6B);
  static const Color onTertiaryContainer = Color(0xFFF5FFF7);
  static const Color tertiaryFixed = Color(0xFFC3ECD7);
  static const Color tertiaryFixedDim = Color(0xFFA8CFBC);
  static const Color onTertiaryFixed = Color(0xFF002115);
  static const Color onTertiaryFixedVariant = Color(0xFF294E3F);

  // Error Colors
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  // Surface Tint
  static const Color surfaceTint = Color(0xFF006C4A);
}
