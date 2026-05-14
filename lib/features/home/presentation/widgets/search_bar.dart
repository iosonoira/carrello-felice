import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';

/// EcoPriceSearchBar widget for searching groceries.
///
/// A custom search input field with integrated barcode scanner button.
/// Handles focus state transitions and provides callbacks for text changes
/// and barcode scanner activation.
class EcoPriceSearchBar extends StatefulWidget {
  /// Called when the search text changes.
  final ValueChanged<String>? onChanged;

  /// Called when the barcode scanner button is pressed.
  final VoidCallback? onBarcodePressed;

  const EcoPriceSearchBar({
    super.key,
    this.onChanged,
    this.onBarcodePressed,
  });

  @override
  State<EcoPriceSearchBar> createState() => _EcoPriceSearchBarState();
}

class _EcoPriceSearchBarState extends State<EcoPriceSearchBar> {
  late final FocusNode _focusNode;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: 'Search for groceries...',
        hintStyle: const TextStyle(
          fontSize: 16.0,
          color: AppColors.outline,
        ),
        // Prefix icon with search icon
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.outline,
        ),
        // Suffix icon with barcode scanner button
        suffixIcon: GestureDetector(
          onTap: widget.onBarcodePressed,
          child: Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryContainer.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: const Icon(
                Icons.barcode_reader,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        // Fill and background color
        filled: true,
        fillColor: AppColors.secondaryContainer.withValues(alpha: 0.1),
        // Content padding
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: 12.0,
        ),
        // Border styling
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2.0,
          ),
        ),
        // Text input styling
        labelStyle: const TextStyle(
          fontSize: 16.0,
          color: AppColors.onSurface,
        ),
      ),
      style: const TextStyle(
        fontSize: 16.0,
        color: AppColors.onSurface,
      ),
    );
  }
}
