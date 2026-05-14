import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/store.dart';

/// A card widget displaying store information with three display variants.
///
/// Supports three distinct layouts determined by the [isFeatured] and
/// [isHighlighted] boolean properties:
/// - **Featured:** Compact row with icon, name, distance, and status badge
/// - **Highlighted:** Row with accent bar, store info, and best price badge
/// - **Normal:** Default row layout with optional price display
///
/// Each variant uses appropriate spacing, colors, and typography from DESIGN.md.
class StoreCard extends StatelessWidget {
  /// Creates a [StoreCard].
  ///
  /// The [store] parameter is required. The [isFeatured] and [isHighlighted]
  /// parameters default to false. The [onTap] and [productPrice] callbacks
  /// are optional.
  const StoreCard({
    required this.store,
    this.isFeatured = false,
    this.isHighlighted = false,
    this.onTap,
    this.productPrice,
    super.key,
  });

  /// The store data to display in the card.
  final Store store;

  /// Whether this card displays in the featured variant (large, prominent card).
  /// Defaults to false.
  final bool isFeatured;

  /// Whether this card displays in the highlighted variant (best price indicator).
  /// Defaults to false.
  final bool isHighlighted;

  /// Optional callback triggered when the card is tapped.
  final VoidCallback? onTap;

  /// Optional price to display for comparison purposes.
  /// Only shown in the normal variant if provided.
  final double? productPrice;

  @override
  Widget build(BuildContext context) {
    if (isFeatured) {
      return _buildFeaturedCard();
    } else if (isHighlighted) {
      return _buildHighlightedCard();
    } else {
      return _buildNormalCard();
    }
  }

  /// Builds the featured card variant.
  ///
  /// Layout: Row with icon, name/distance, and status badge.
  /// Background: surfaceContainerLowest with 1px surfaceContainer border.
  /// Soft shadow.
  /// Height: auto, adapts to content
  Widget _buildFeaturedCard() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          border: Border.all(
            color: AppColors.surfaceContainer,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppRadius.none),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppSpacing.stackMd),
        child: Row(
          children: [
            // Left: Store icon in circle
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.primaryContainer.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.storefront,
                size: 14,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: AppSpacing.stackMd),
            // Middle: Store name and distance
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    store.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.43,
                      color: AppColors.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: AppColors.outline,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${store.distance.toStringAsFixed(1)} km',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.43,
                            letterSpacing: 0.7,
                            color: AppColors.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.stackMd),
            // Right: Status badge
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.onPrimary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Open',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.43,
                      letterSpacing: 0.7,
                      color: AppColors.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the highlighted card variant.
  ///
  /// Layout: Row with left accent bar + content + price badge.
  /// Background: surfaceContainerLowest with 1px tertiaryContainer/30 border.
  /// Left bar: 4px wide, tertiaryContainer color, rounded corners.
  /// Height: 80px
  Widget _buildHighlightedCard() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          border: Border.all(
            color: AppColors.tertiaryContainer.withValues(alpha: 0.3),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppRadius.none),
        ),
        child: Row(
          children: [
            // Left: Accent bar
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: AppColors.tertiaryContainer,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.none),
                  bottomLeft: Radius.circular(AppRadius.none),
                ),
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    // Store icon
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(AppRadius.md),
                      ),
                      child: const Icon(
                        Icons.storefront,
                        size: 20,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    // Store info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            store.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: AppColors.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 14,
                                color: AppColors.outline,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  '${store.distance.toStringAsFixed(1)} km',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                    color: AppColors.onSurfaceVariant,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Right side: Price + BEST PRICE badge
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${store.productPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      height: 1.33,
                      color: AppColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.tertiaryContainer,
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: const Text(
                      'BEST PRICE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.33,
                        letterSpacing: 0.6,
                        color: AppColors.onTertiaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the normal card variant (default).
  ///
  /// Layout: Row with icon, name/distance, optional price.
  /// Background: surfaceContainerLowest, transparent border.
  /// Soft shadow (subtle, 0.02 opacity).
  /// Height: dynamic based on content.
  Widget _buildNormalCard() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          border: Border.all(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppRadius.none),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            // Left: Store icon in circle
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.storefront,
                size: 20,
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            // Middle: Store name and distance with optional hours
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    store.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: AppColors.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: AppColors.outline,
                      ),
                      const SizedBox(width: 4),
                      if (store.hoursUntil != null) ...[
                        Expanded(
                          child: Text(
                            '${store.distance.toStringAsFixed(1)} km • ${store.hoursUntil}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                              letterSpacing: 0.7,
                              color: AppColors.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ] else ...[
                        Expanded(
                          child: Text(
                            '${store.distance.toStringAsFixed(1)} km',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                              letterSpacing: 0.7,
                              color: AppColors.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            // Right: Price if provided
            if (productPrice != null) ...[
              const SizedBox(width: AppSpacing.md),
              Text(
                '\$${productPrice!.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 1.33,
                  color: AppColors.primary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
