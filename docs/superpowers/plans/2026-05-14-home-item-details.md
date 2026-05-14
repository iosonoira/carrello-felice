# Home & Item Details Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement Home and Item Details screens in Flutter, following DESIGN.md tokens, with hardcoded mock data and navigation between screens.

**Architecture:** Clean Architecture (data/presentation split). Models are freezed. Screens import data directly from mock_data.dart. Routing via GoRouter. Reusable widgets in separate files.

**Tech Stack:** Flutter, Riverpod (provider setup ready for future use), Freezed, GoRouter, Material Icons

---

## Task 1: Create Design Token Files (Colors & Spacing)

**Files:**
- Create: `lib/core/theme/app_colors.dart`
- Create: `lib/core/constants/app_spacing.dart`

- [ ] **Step 1: Create app_colors.dart**

```dart
// lib/core/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF006948);
  static const Color primaryContainer = Color(0xFF00855d);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color inversePrimary = Color(0xFF68dba9);

  // Secondary
  static const Color secondary = Color(0xFF43664d);
  static const Color secondaryContainer = Color(0xFFC2E9C9);
  static const Color onSecondary = Color(0xFFFFFFFF);

  // Tertiary
  static const Color tertiary = Color(0xFF3f6353);
  static const Color tertiaryContainer = Color(0xFF577c6b);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onTertiaryContainer = Color(0xFFF5FFF7);

  // Surface
  static const Color surface = Color(0xFFF8F9FA);
  static const Color surfaceDim = Color(0xFFd9dadb);
  static const Color surfaceBright = Color(0xFFF8F9FA);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF3F4F5);
  static const Color surfaceContainer = Color(0xFFedeeef);
  static const Color surfaceContainerHigh = Color(0xFFe7e8e9);
  static const Color surfaceContainerHighest = Color(0xFFe1e3e4);

  // On Surface
  static const Color onSurface = Color(0xFF191c1d);
  static const Color onSurfaceVariant = Color(0xFF3d4a42);
  static const Color inverseSurface = Color(0xFF2e3132);
  static const Color inverseOnSurface = Color(0xFFF0F1F2);

  // Outline
  static const Color outline = Color(0xFF6d7a72);
  static const Color outlineVariant = Color(0xFFbccac0);

  // Error
  static const Color error = Color(0xFFba1a1a);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFffdad6);
  static const Color onErrorContainer = Color(0xFF93000a);

  // Background
  static const Color background = Color(0xFFF8F9FA);
  static const Color onBackground = Color(0xFF191c1d);
}
```

- [ ] **Step 2: Create app_spacing.dart**

```dart
// lib/core/constants/app_spacing.dart
class AppSpacing {
  // Base unit
  static const double base = 8.0;

  // Scale
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  // Mobile
  static const double marginMobile = 16.0;

  // Stack variants
  static const double stackSm = 4.0;
  static const double stackMd = 12.0;
  static const double stackLg = 24.0;

  // Gutter
  static const double gutter = 16.0;

  // Container
  static const double containerMax = 1200.0;
}

class AppRadius {
  static const double small = 4.0;
  static const double normal = 8.0;
  static const double medium = 12.0;
  static const double large = 16.0;
  static const double xl = 24.0;
  static const double full = 9999.0;
}
```

- [ ] **Step 3: Commit**

```bash
git add lib/core/theme/app_colors.dart lib/core/constants/app_spacing.dart
git commit -m "feat: add design tokens from DESIGN.md"
```

---

## Task 2: Create Data Models (Freezed)

**Files:**
- Create: `lib/features/home/data/models/product.dart`
- Create: `lib/features/home/data/models/store.dart`

- [ ] **Step 1: Create product.dart**

```dart
// lib/features/home/data/models/product.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String category,
    required String description,
    required double price,
    required String unit,
    required String imageUrl,
    required bool isBestPrice,
  }) = _Product;
}
```

- [ ] **Step 2: Create store.dart**

```dart
// lib/features/home/data/models/store.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@freezed
class Store with _$Store {
  const factory Store({
    required String id,
    required String name,
    required double distance,
    required String? hoursUntil,
    required bool isOpen,
    required double productPrice,
  }) = _Store;
}
```

- [ ] **Step 3: Run build_runner**

```bash
dart run build_runner build --delete-conflicting-outputs
```

Expected: Generates product.freezed.dart and store.freezed.dart

- [ ] **Step 4: Commit**

```bash
git add lib/features/home/data/models/
git commit -m "feat: add Product and Store freezed models"
```

---

## Task 3: Create Mock Data

**Files:**
- Create: `lib/features/home/data/mock_data.dart`

- [ ] **Step 1: Create mock_data.dart**

```dart
// lib/features/home/data/mock_data.dart
import 'models/product.dart';
import 'models/store.dart';

// Mock Products for home trending section
final mockProducts = [
  const Product(
    id: '1',
    name: 'Organic Bananas',
    category: 'Produce',
    description: 'Fresh, vibrant yellow organic bananas.',
    price: 0.59,
    unit: '/lb',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBW8hpSEARAUxXQjWCtdLdSb1YfwXCigQFSmFZBFCoU2n6v5aewULHtZY4guoGKMyI3f9UASKKH8SpMQICIBdOItBdzl3ZGxE61b30G1X4ouEQOR9yKUEdBvHt-2blM6Ty9_90F8LFKVts9pmdWJ4iOpDr1fNlEmeLPR8wcMfOsW4TfAUHJUfT1mHlaC9f9Qo8viKX4cEKidqSf8YRQ6NIZ2d-av4DezerU2YqITHTU6mEp0TVDwntqyRdzTHK5mWG_2eZ8gGgK_Tk',
    isBestPrice: true,
  ),
  const Product(
    id: '2',
    name: 'Almond Milk',
    category: 'Dairy Alt',
    description: 'Premium almond milk in convenient carton.',
    price: 3.49,
    unit: '/ea',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDS9ogoj_zfGz1IWUdWnZNVioPmO2QObEWz1aPR0lC-6BWFH198L609iKxy0BMr1oAXQcqLaV1FNsDdVAi8SBkGArY8aXPHelghbTeVJrmDTahVXJk2HHF-zlXF5FyT1S30JteedMxfclqL9nb7KKAazZnsGiT9vUxmvgCqyU9DNNckcIwiPYwnxypVKqnRB64rdhQFP0_ybJk0LXedK4qVrsOJ7uWSCYgvWEIci9RMOcjKgWVY-Rt1jDislpwXij_ax0NydU88ZmM',
    isBestPrice: false,
  ),
  const Product(
    id: '3',
    name: 'Hass Avocados',
    category: 'Produce',
    description:
        'Pack of 4, perfectly ripe and ready to eat. Sourced locally when possible to ensure peak freshness and quality.',
    price: 1.25,
    unit: '/ea',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCpaSeHa12Oj_naAl-SbWrTwhzC-OyGLuLhLLOrJup952wuIov1AA2U_YjVun1oZUgPBhBSYY9e5SBHAV7omZAHSF9Iqqiud5Jmo0bjQ8f_nqSQPFXK4USD97wGVU9T6Sw5UMAbFu6IU-9ncjNVBLvKlFsq9tRuZ7jbLuqkPNgLeU_Wvt45cTJSZFel59NVWiXDrXD1DJNhaM_W-8bZIDE_9G1cMPQM6t6cgCaLoVXLSGo__syaf1yfTjPHWlBLTtn5aURM9WFQa3s',
    isBestPrice: true,
  ),
];

// Mock Stores for home nearby section
final mockStores = [
  const Store(
    id: '1',
    name: 'GreenGrocer',
    distance: 0.5,
    hoursUntil: null,
    isOpen: true,
    productPrice: 0.0,
  ),
  const Store(
    id: '2',
    name: 'FreshMart',
    distance: 1.2,
    hoursUntil: 'Open until 10 PM',
    isOpen: true,
    productPrice: 0.0,
  ),
  const Store(
    id: '3',
    name: 'City Market',
    distance: 2.0,
    hoursUntil: 'Open until 9 PM',
    isOpen: true,
    productPrice: 0.0,
  ),
];

// Selected product for item details screen
final selectedProduct = mockProducts[2]; // Hass Avocados

// Stores with prices for selected product
final storesForProduct = [
  const Store(
    id: '1',
    name: 'Fresh Market',
    distance: 1.2,
    hoursUntil: null,
    isOpen: true,
    productPrice: 3.99,
  ),
  const Store(
    id: '2',
    name: 'City Grocers',
    distance: 0.8,
    hoursUntil: null,
    isOpen: true,
    productPrice: 4.49,
  ),
  const Store(
    id: '3',
    name: 'Organic Whole Foods',
    distance: 3.5,
    hoursUntil: null,
    isOpen: true,
    productPrice: 5.99,
  ),
];
```

- [ ] **Step 2: Commit**

```bash
git add lib/features/home/data/mock_data.dart
git commit -m "feat: add mock data for products and stores"
```

---

## Task 4: Create Custom AppBar Widget

**Files:**
- Create: `lib/features/home/presentation/widgets/app_bar.dart`

- [ ] **Step 1: Create app_bar.dart**

```dart
// lib/features/home/presentation/widgets/app_bar.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_spacing.dart';

class EcoPriceAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onTrailingPressed;

  const EcoPriceAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.trailing,
    this.onLeadingPressed,
    this.onTrailingPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.surface.withOpacity(0.9),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(),
        ),
      ),
      leading: leading != null
          ? IconButton(
              icon: leading!,
              onPressed: onLeadingPressed,
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Public Sans',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
          letterSpacing: -0.02,
        ),
      ),
      centerTitle: true,
      trailing: trailing != null
          ? IconButton(
              icon: trailing!,
              onPressed: onTrailingPressed,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
```

- [ ] **Step 2: Commit**

```bash
git add lib/features/home/presentation/widgets/app_bar.dart
git commit -m "feat: add custom EcoPriceAppBar widget"
```

---

## Task 5: Create SearchBar Widget

**Files:**
- Create: `lib/features/home/presentation/widgets/search_bar.dart`

- [ ] **Step 1: Create search_bar.dart**

```dart
// lib/features/home/presentation/widgets/search_bar.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_spacing.dart';

class EcoPriceSearchBar extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onBarcodePressed;

  const EcoPriceSearchBar({
    Key? key,
    this.onChanged,
    this.onBarcodePressed,
  }) : super(key: key);

  @override
  State<EcoPriceSearchBar> createState() => _EcoPriceSearchBarState();
}

class _EcoPriceSearchBarState extends State<EcoPriceSearchBar> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.marginMobile),
      child: TextField(
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: 'Search for groceries...',
          hintStyle: const TextStyle(
            fontFamily: 'Public Sans',
            fontSize: 16,
            color: AppColors.outline,
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.outline),
          suffixIcon: GestureDetector(
            onTap: widget.onBarcodePressed,
            child: Container(
              margin: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer.withOpacity(0.2),
                borderRadius: BorderRadius.circular(AppRadius.medium),
              ),
              child: const Icon(
                Icons.barcode_reader,
                color: AppColors.primary,
                size: 20,
              ),
            ),
          ),
          filled: true,
          fillColor: AppColors.secondaryContainer.withOpacity(0.1),
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
              width: 2,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        style: const TextStyle(
          fontFamily: 'Public Sans',
          fontSize: 16,
          color: AppColors.onSurface,
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Commit**

```bash
git add lib/features/home/presentation/widgets/search_bar.dart
git commit -m "feat: add EcoPriceSearchBar widget"
```

---

## Task 6: Create TrendingItemCard Widget

**Files:**
- Create: `lib/features/home/presentation/widgets/trending_item_card.dart`

- [ ] **Step 1: Create trending_item_card.dart**

```dart
// lib/features/home/presentation/widgets/trending_item_card.dart
import 'package:flutter/material.dart';
import '../../data/models/product.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_spacing.dart';

class TrendingItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const TrendingItemCard({
    Key? key,
    required this.product,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppSpacing.stackMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with badge
            Stack(
              children: [
                Container(
                  height: 96,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(AppRadius.medium),
                  ),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: AppColors.surfaceContainer,
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
                if (product.isBestPrice)
                  Positioned(
                    top: AppSpacing.sm,
                    right: AppSpacing.sm,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.tertiaryContainer,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: const Text(
                        'Best Price',
                        style: TextStyle(
                          fontFamily: 'Public Sans',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.onTertiaryContainer,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.stackSm),
            // Category
            Text(
              product.category,
              style: const TextStyle(
                fontFamily: 'Public Sans',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.outline,
                letterSpacing: 0.05,
              ),
            ),
            const SizedBox(height: 4),
            // Product name
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Public Sans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            // Price
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontFamily: 'Public Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: ' ${product.unit}',
                    style: const TextStyle(
                      fontFamily: 'Public Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.outline,
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
}
```

- [ ] **Step 2: Commit**

```bash
git add lib/features/home/presentation/widgets/trending_item_card.dart
git commit -m "feat: add TrendingItemCard widget"
```

---

## Task 7: Create StoreCard Widget

**Files:**
- Create: `lib/features/home/presentation/widgets/store_card.dart`

- [ ] **Step 1: Create store_card.dart with all three variants (featured, highlighted, normal)**

[Código completo do StoreCard con las 3 variantes: _buildFeaturedCard(), _buildHighlightedCard(), _buildNormalCard()]

---

## Task 8: Create NearbyStoresSection Widget

**Files:**
- Create: `lib/features/home/presentation/widgets/nearby_stores_section.dart`

---

## Task 9: Create HomeScreen

**Files:**
- Create: `lib/features/home/presentation/screens/home_screen.dart`

---

## Task 10: Create ItemDetailsScreen

**Files:**
- Create: `lib/features/home/presentation/screens/item_details_screen.dart`

---

## Task 11: Update GoRouter & Main

**Files:**
- Create: `lib/core/router/app_router.dart`
- Modify: `lib/main.dart`

---

## Task 12: Test & Verify

- [ ] Run flutter pub get
- [ ] Run build_runner
- [ ] Run flutter run
- [ ] Manual testing checklist
- [ ] Commit test pass
