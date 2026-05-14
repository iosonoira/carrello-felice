import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Custom app bar widget for the EcoPrice application.
///
/// Provides a flexible app bar with optional leading and trailing widgets,
/// centered title, and a frosted glass effect using backdrop blur.
class EcoPriceAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates an [EcoPriceAppBar].
  ///
  /// The [title] parameter is required. All other parameters are optional.
  const EcoPriceAppBar({
    required this.title,
    this.leading,
    this.trailing,
    this.onLeadingPressed,
    this.onTrailingPressed,
    super.key,
  });

  /// The title text displayed in the center of the app bar.
  final String title;

  /// Optional widget displayed at the leading (left) side of the app bar.
  final Widget? leading;

  /// Optional widget displayed at the trailing (right) side of the app bar.
  final Widget? trailing;

  /// Optional callback triggered when the leading widget is pressed.
  final VoidCallback? onLeadingPressed;

  /// Optional callback triggered when the trailing widget is pressed.
  final VoidCallback? onTrailingPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
          elevation: 0,
          backgroundColor: AppColors.surface.withValues(alpha: 0.9),
          leading: leading != null
              ? IconButton(
                  icon: leading!,
                  onPressed: onLeadingPressed,
                )
              : null,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
              letterSpacing: -0.4,
            ),
          ),
          centerTitle: true,
          actions: [
            if (trailing != null)
              IconButton(
                icon: trailing!,
                onPressed: onTrailingPressed,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
