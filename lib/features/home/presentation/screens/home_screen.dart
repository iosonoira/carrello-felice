import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/mock_data.dart';
import '../widgets/app_bar.dart';
import '../widgets/nearby_stores_section.dart';
import '../widgets/search_bar.dart';
import '../widgets/trending_item_card.dart';

/// HomeScreen displays the main shopping interface with trending items and nearby stores.
///
/// Contains:
/// - AppBar with menu and search icon
/// - Search bar with barcode scanner integration
/// - Horizontal scrollable list of trending items
/// - Nearby stores section with featured and grid stores
/// - Bottom navigation bar with Home active
class HomeScreen extends StatelessWidget {
  /// Creates a [HomeScreen].
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const EcoPriceAppBar(
        title: 'EcoPrice',
        leading: Icon(Icons.menu, color: AppColors.primary),
        trailing: Icon(Icons.search, color: AppColors.primary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.marginMobile,
                vertical: AppSpacing.stackMd,
              ),
              child: EcoPriceSearchBar(
                onBarcodePressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Barcode scanner not yet implemented'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),

            // Trending items section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.marginMobile,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with "Trending Items" and "See All"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Trending Items',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 32 / 24,
                          color: AppColors.onSurface,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to see all trending items (future implementation)
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('See all trending items'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.stackMd),

                  // Horizontal scrollable list of trending items
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...mockProducts.map(
                          (product) => Padding(
                            padding: const EdgeInsets.only(
                              right: AppSpacing.stackMd,
                            ),
                            child: TrendingItemCard(
                              product: product,
                              onTap: () {
                                context.push('/item/${product.id}');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.stackLg),

            // Nearby stores section
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.stackMd),
              child: NearbyStoresSection(
                stores: mockStores,
                onStoreTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Store details not yet implemented'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),

            // Bottom spacer for bottom nav
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildCustomBottomNav(context),
    );
  }

  /// Builds the custom bottom navigation bar with 4 tabs and glassmorphism effect.
  Widget _buildCustomBottomNav(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.9),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 16,
                offset: const Offset(0, -2),
                spreadRadius: 0,
              ),
            ],
          ),
          padding: EdgeInsets.only(
            left: AppSpacing.marginMobile,
            right: AppSpacing.marginMobile,
            top: AppSpacing.stackMd,
            bottom: AppSpacing.stackMd + MediaQuery.of(context).padding.bottom,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Home tab (active)
              _buildNavItem(
                icon: Icons.home_filled,
                label: 'Home',
                isActive: true,
                onTap: () {
                  // Already on home screen
                },
              ),
              // Compare tab
              _buildNavItem(
                icon: Icons.compare_arrows,
                label: 'Compare',
                isActive: false,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Compare screen not yet implemented'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
              // Map tab
              _buildNavItem(
                icon: Icons.location_on,
                label: 'Map',
                isActive: false,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Map screen not yet implemented'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
              // Account tab
              _buildNavItem(
                icon: Icons.person,
                label: 'Account',
                isActive: false,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Account screen not yet implemented'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a single bottom navigation tab item with icon and label.
  ///
  /// Active tabs show primary color with secondary container background (30% opacity).
  /// Inactive tabs show outline variant color.
  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.secondaryContainer.withValues(alpha: 0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.primary : AppColors.onSurfaceVariant,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive
                    ? AppColors.primary
                    : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
