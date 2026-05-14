import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

/// Builds the application [ThemeData].
///
/// Use [AppTheme.light] in [MaterialApp.theme].
abstract final class AppTheme {
  /// Light theme wired up with the full DESIGN.md color scheme and text scale.
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        fontFamily: 'Public Sans',
        textTheme: const TextTheme(
          headlineLarge: AppTextStyles.headlineLg,
          headlineMedium: AppTextStyles.headlineLgMobile,
          headlineSmall: AppTextStyles.headlineMd,
          titleLarge: AppTextStyles.headlineSm,
          bodyLarge: AppTextStyles.bodyLg,
          bodyMedium: AppTextStyles.bodyMd,
          labelLarge: AppTextStyles.labelMd,
          labelSmall: AppTextStyles.labelSm,
        ).apply(fontFamily: 'Public Sans'),
      );
}
