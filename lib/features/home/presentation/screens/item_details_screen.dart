import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/mock_data.dart';
import '../widgets/app_bar.dart';

/// ItemDetailsScreen displays detailed information for a selected product.
///
/// Contains:
/// - EcoPriceAppBar with back button, logo, and favorite icon
/// - Product hero section with image and info (responsive layout)
/// - Compare prices section showing prices from nearby stores
/// - Bottom navigation bar with Compare tab active
class ItemDetailsScreen extends StatelessWidget {
  /// Creates an [ItemDetailsScreen].
  ///
  /// The [productId] parameter is passed but not used (ready for future routing).
  /// Currently always displays selectedProduct from mock_data.
  const ItemDetailsScreen({
    super.key,
    required String productId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: EcoPriceAppBar(
        title: 'Product Details',
        leading: const Icon(Icons.arrow_back, color: AppColors.primary),
        onLeadingPressed: () {
          context.pop();
        },
        trailing: const Icon(Icons.favorite_border, color: AppColors.primary),
        onTrailingPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Favorite not yet implemented'),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Hero Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.marginMobile,
                vertical: AppSpacing.stackMd,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 768;

                  if (isMobile) {
                    // Mobile: Column layout (image above, info below)
                    return Column(
                      children: [
                        // Image card
                        _buildProductImageCard(),
                        const SizedBox(height: AppSpacing.stackMd),
                        // Info card
                        _buildProductInfoCard(context),
                      ],
                    );
                  } else {
                    // Desktop: Row layout (image left, info right)
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image card
                        Flexible(
                          flex: 1,
                          child: _buildProductImageCard(),
                        ),
                        const SizedBox(width: AppSpacing.stackMd),
                        // Info card
                        Flexible(
                          flex: 1,
                          child: _buildProductInfoCard(context),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),

            // Compare Prices Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.marginMobile,
                vertical: AppSpacing.stackMd,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header: "Compare Prices" + "3 Stores Nearby"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Compare Prices',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 32 / 24,
                          color: AppColors.onSurface,
                        ),
                      ),
                      Text(
                        '${storesForProduct.length} Stores Nearby',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 20 / 14,
                          letterSpacing: 0.7,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.stackMd),

                  // Store price cards
                  ...storesForProduct.asMap().entries.map((entry) {
                    final index = entry.key;
                    final store = entry.value;
                    final isHighlighted = index == 0; // First store is highlighted

                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.stackMd),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Store details for ${store.name} not yet implemented'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        child: _buildStorePriceCard(
                          store: store,
                          isHighlighted: isHighlighted,
                        ),
                      ),
                    );
                  }),
                ],
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

  /// Builds the product image card with rounded corners, soft shadow, and error fallback.
  Widget _buildProductImageCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF064E3B).withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        child: AspectRatio(
          aspectRatio: 1,
          child: CachedNetworkImage(
            imageUrl: selectedProduct.imageUrl,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return Container(
                color: AppColors.surfaceContainerHigh,
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: AppColors.onSurfaceVariant,
                    size: 48,
                  ),
                ),
              );
            },
            placeholder: (context, url) {
              return Container(
                color: AppColors.surfaceContainerHigh,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
              );
            },
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  blendMode: BlendMode.multiply,
                  child: Container(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Builds the product info card with category, name, description, and add to list button.
  Widget _buildProductInfoCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF064E3B).withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppSpacing.stackMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category label (uppercase, Label-MD, variant color)
          Text(
            selectedProduct.category.toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 20 / 14,
              letterSpacing: 0.7,
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.stackSm),

          // Product name (Headline-LG, 32px, weight 700, -0.02em spacing)
          Text(
            selectedProduct.name,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 40 / 32,
              letterSpacing: -0.64,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.stackSm),

          // Description (Body-MD, variant color)
          Text(
            selectedProduct.description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 24 / 16,
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.stackMd),

          // Price display
          Text(
            '\$${selectedProduct.price.toStringAsFixed(2)}${selectedProduct.unit}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 32 / 24,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.stackMd),

          // "Add to List" button (ElevatedButton, Primary bg, full width, 48px height, rounded full)
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to list!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Add to List',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a store price card with price display, store name, and distance.
  ///
  /// If [isHighlighted] is true, shows a left accent bar and "BEST PRICE" badge.
  Widget _buildStorePriceCard({
    required dynamic store,
    required bool isHighlighted,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: isHighlighted
            ? null
            : Border.all(
                color: AppColors.outlineVariant,
                width: 1,
              ),
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                  spreadRadius: 0,
                ),
              ]
            : [],
      ),
      child: Row(
        children: [
          // Left accent bar for highlighted card
          if (isHighlighted)
            Container(
              width: 4,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.md),
                  bottomLeft: Radius.circular(AppRadius.md),
                ),
              ),
            ),

          // Store info and price
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.stackMd),
              child: Row(
                children: [
                  // Store details (left side)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              store.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 24 / 16,
                                color: AppColors.onSurface,
                              ),
                            ),
                            if (isHighlighted) ...[
                              const SizedBox(width: AppSpacing.stackSm),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.xs,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.sm),
                                ),
                                child: const Text(
                                  'BEST PRICE',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                    color: AppColors.onPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${store.distance} km away',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 16 / 12,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Price (right side)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${store.productPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 28 / 20,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        store.isOpen ? 'Open Now' : 'Closed',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 16 / 12,
                          color: store.isOpen
                              ? AppColors.primary
                              : AppColors.error,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the custom bottom navigation bar with 4 tabs and glassmorphism effect.
  /// Compare tab is active on this screen.
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
              // Home tab
              _buildNavItem(
                icon: Icons.home_filled,
                label: 'Home',
                isActive: false,
                onTap: () {
                  context.go('/');
                },
              ),
              // Compare tab (active)
              _buildNavItem(
                icon: Icons.compare_arrows,
                label: 'Compare',
                isActive: true,
                onTap: () {
                  // Already on compare screen
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
