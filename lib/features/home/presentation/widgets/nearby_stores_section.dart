import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/store.dart';
import 'store_card.dart';

/// A section widget displaying nearby stores with a featured store and grid of additional stores.
///
/// Displays stores in a hierarchical layout:
/// 1. "Nearby Stores" headline (Headline-MD)
/// 2. Featured store card (full width, isFeatured=true)
/// 3. Grid of 2 equal-width smaller stores (normal variant)
///
/// If [stores] is empty, returns a [SizedBox.shrink()] to hide the section.
/// If fewer than 3 stores are available, falls back to stores[0] for missing positions.
class NearbyStoresSection extends StatelessWidget {
  /// Creates a [NearbyStoresSection].
  ///
  /// The [stores] parameter is required. The [onStoreTap] callback is optional.
  const NearbyStoresSection({
    required this.stores,
    this.onStoreTap,
    super.key,
  });

  /// List of stores to display in the section.
  final List<Store> stores;

  /// Optional callback triggered when any store card is tapped.
  final VoidCallback? onStoreTap;

  @override
  Widget build(BuildContext context) {
    // Hide section if no stores available
    if (stores.isEmpty) {
      return SizedBox.shrink();
    }

    // Get stores for featured and grid positions with fallback
    final featuredStore = stores[0];
    final gridStore1 = stores.length > 1 ? stores[1] : stores[0];
    final gridStore2 = stores.length > 2 ? stores[2] : stores[0];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header: "Nearby Stores"
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.marginMobile,
          ),
          child: Text(
            'Nearby Stores',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 32 / 24,
              color: AppColors.onSurface,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.stackMd),

        // Featured store card (full width)
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.marginMobile,
          ),
          child: StoreCard(
            store: featuredStore,
            isFeatured: true,
            onTap: onStoreTap,
          ),
        ),
        const SizedBox(height: AppSpacing.stackMd),

        // Grid: 2 smaller stores side by side
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.marginMobile,
          ),
          child: Row(
            children: [
              // Left store
              Expanded(
                child: StoreCard(
                  store: gridStore1,
                  onTap: onStoreTap,
                ),
              ),
              const SizedBox(width: AppSpacing.stackMd),
              // Right store
              Expanded(
                child: StoreCard(
                  store: gridStore2,
                  onTap: onStoreTap,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
