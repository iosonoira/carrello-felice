# Home & Item Details Screens — Design Spec

**Date:** 2026-05-14  
**Project:** SmartPrice (carrello_leggero)  
**Scope:** Replicate 3 mockup UI screens (home, item_details) in Flutter using DESIGN.md token system

---

## Overview

Implement two Flutter screens—Home and Item Details—following the existing mockup HTML structure and adhering strictly to DESIGN.md for colors, typography, spacing, and component styling. Data is hardcoded in separate files for now. Navigation uses GoRouter with placeholder tabs for other routes.

---

## Architecture: Minimal Clean Architecture

### File Structure

```
lib/
├── features/
│   └── home/
│       ├── data/
│       │   ├── models/
│       │   │   ├── product.dart       # Freezed model for Product
│       │   │   └── store.dart         # Freezed model for Store
│       │   └── mock_data.dart         # Hardcoded lists: mockProducts, mockStores
│       └── presentation/
│           ├── screens/
│           │   ├── home_screen.dart
│           │   └── item_details_screen.dart
│           └── widgets/
│               ├── trending_item_card.dart
│               ├── store_card.dart
│               ├── search_bar.dart
│               ├── nearby_stores_section.dart
│               └── app_bar.dart
├── core/
│   ├── theme/
│   │   └── app_colors.dart            # Color tokens from DESIGN.md
│   └── constants/
│       └── app_spacing.dart           # Spacing tokens from DESIGN.md
├── main.dart                          # GoRouter setup
└── ...
```

---

## Design Tokens (from DESIGN.md)

### Colors
- **Primary:** #006948 (Emerald, CTAs)
- **Primary-Container:** #00855d
- **On-Primary:** #ffffff
- **Secondary-Container:** #c2e9c9 (subtle backgrounds)
- **Tertiary-Container:** #577c6b (badge backgrounds)
- **On-Tertiary-Container:** #f5fff7
- **Surface:** #f8f9fa (main background)
- **Surface-Container-Lowest:** #ffffff (card backgrounds)
- **On-Surface:** #191c1d (primary text)
- **On-Surface-Variant:** #3d4a42 (secondary text)
- **Outline:** #6d7a72 (borders, dividers)
- **Outline-Variant:** #bccac0

### Typography (Public Sans)
- **Headline-MD:** 24px / 600 weight / 32px line-height
- **Headline-SM:** 20px / 600 weight / 28px line-height
- **Body-LG:** 18px / 400 weight / 28px line-height
- **Body-MD:** 16px / 400 weight / 24px line-height
- **Label-MD:** 14px / 600 weight / 20px line-height + 0.05em letter-spacing
- **Label-SM:** 12px / 500 weight / 16px line-height

### Spacing (8px base scale)
- **Base:** 8px
- **XS:** 4px
- **SM:** 8px
- **MD:** 16px
- **LG:** 24px
- **XL:** 32px
- **Margin-Mobile:** 16px
- **Stack-MD:** 12px
- **Stack-SM:** 4px

### Radius
- **Default:** 0.5rem (8px)
- **LG:** 1rem (16px)
- **XL:** 1.5rem (24px)

---

## Data Models

### Product
```dart
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String category,
    required String description,
    required double price,
    required String unit,          // "/lb", "/ea"
    required String imageUrl,       // placeholder URL
    required bool isBestPrice,
  }) = _Product;
}
```

### Store
```dart
@freezed
class Store with _$Store {
  const factory Store({
    required String id,
    required String name,
    required double distance,       // miles
    required String? hoursUntil,    // "Open until 10 PM" or null if closed
    required bool isOpen,
    required double productPrice,   // price at this store
  }) = _Store;
}
```

### mock_data.dart
Exports two hardcoded lists:
- `mockProducts` — 3 Product instances (Organic Bananas, Almond Milk, Hass Avocados)
- `mockStores` — 3 Store instances (GreenGrocer, FreshMart, City Market)
- `selectedProduct` — Hass Avocados (for item_details demo)
- `storesForProduct` — 3 stores with prices for Hass Avocados

---

## Home Screen (`home_screen.dart`)

### Layout Structure
1. **TopAppBar**
   - Fixed header, translucent backdrop blur
   - Menu icon (left) + CarrelloLeggero logo (center) + Search icon (right)
   - Colors: Surface/90 background, On-Surface-Variant icons

2. **SearchBar Section** (below header, sticky within scroll)
   - Input field with search icon + placeholder
   - Barcode scanner button (right side, Primary-Container/20 background)
   - Border: 1px On-Surface-Variant on focus → 2px Primary
   - Spacing: margin-mobile (16px) on sides

3. **Trending Items Section** (horizontal scrollable)
   - Header: "Trending Items" + "See All" link
   - Cards in horizontal scroll (snap-mandatory)
   - Each card: 160px width, white background, rounded-xl (8px)
     - Image placeholder (rounded-lg inside)
     - Category label (Label-MD, On-Surface-Variant)
     - Product name (Body-MD, medium)
     - Price (Label-MD, Primary color, bold)
     - Badge: "Best Price" (Tertiary-Container, top-right)

4. **Nearby Stores Section** (2-column bento grid)
   - Header: "Nearby Stores"
   - Featured store: col-span-2
     - Store icon (circle, Primary-Container/20)
     - Store name (Body-LG, semibold)
     - Distance + Location icon (Label-MD, On-Surface-Variant)
     - "Open" badge (Surface-Container, dot indicator)
   - Two smaller cards below (col-span-1 each)
     - Store name (Body-MD, semibold)
     - Distance + icon
     - Hours text (Label-MD, On-Surface-Variant)

5. **BottomNavBar** (fixed, mobile-only)
   - 4 tabs: Home (active), Compare, Map, Account
   - Active tab: Primary color + Secondary-Container/30 background
   - Rounded filled pill shape
   - Each has icon + label (Label-MD)

### Interactions
- Tap product card → Navigate to item_details_screen with product ID
- Tap store card → Placeholder (toast or navigate to store details TBD)
- Tap other nav tabs → Placeholder screens

---

## Item Details Screen (`item_details_screen.dart`)

### Layout Structure
1. **TopAppBar**
   - Back button (left) + CarrelloLeggero logo (center) + Favorite icon (right)
   - Same styling as home

2. **Product Hero Section** (2-column grid, desktop stacks to 1)
   - **Image Card** (left, aspect-square)
     - White background, rounded-xl
     - Image centered, rounded-lg, mix-blend-multiply
     - Soft shadow
   - **Info Card** (right)
     - White background, rounded-xl
     - Category label (Label-MD, uppercase, On-Surface-Variant)
     - Product name (Headline-LG)
     - Description (Body-MD, On-Surface-Variant)
     - "Add to List" button (Primary, full-width, icon + text)
     - Soft shadow

3. **Compare Prices Section**
   - Header: "Compare Prices" + "3 Stores Nearby"
   - Store cards (flex column, stack-base gap)
   - **Best Price Card** (highlighted)
     - Left accent bar (1px, Tertiary-Container)
     - Store icon + name (Body-LG, medium)
     - Distance + location icon (Body-MD, On-Surface-Variant)
     - Price (Headline-MD, On-Surface)
     - Badge: "BEST PRICE" (Tertiary-Container, Label-MD, bold)
   - **Other Store Cards** (neutral)
     - Same structure, no accent bar
     - No badge
     - Subtle hover border

### Interactions
- Back button → Pop to home
- Favorite icon → Placeholder
- "Add to List" → Placeholder (toast TBD)
- Tap store card → Placeholder

---

## Reusable Widgets

### `TrendingItemCard`
- Props: Product model, onTap callback
- Renders: Image, category, name, price, badge

### `StoreCard`
- Props: Store model, isFeatured (bool), isHighlighted (bool), onTap callback
- Renders: Icon, name, distance, hours/status, price (if applicable)

### `SearchBar`
- Props: onChanged, onBarcodePressed
- Renders: Input + barcode button

### `NearbyStoresSection`
- Props: List<Store>, onStoreTap callback
- Renders: Bento grid layout

### `AppBar`
- Props: title, leading (icon/button), trailing (icon/button)
- Renders: Fixed header with blur backdrop

---

## Navigation

- **GoRouter** in main.dart
- Routes:
  - `/` → HomeScreen (initial)
  - `/item/:id` → ItemDetailsScreen (parameterized, but hardcoded for now)
  - `/compare` → PlaceholderScreen (TBD)
  - `/map` → PlaceholderScreen (TBD)
  - `/account` → PlaceholderScreen (TBD)

- Bottom nav taps → Pop route or navigate to placeholder

---

## Implementation Notes

1. **No Provider for State (yet):** Data is imported directly from mock_data.dart. When API integration arrives, wrap in AsyncNotifierProvider.
2. **Image Placeholders:** Use `CachedNetworkImage` with a grey container fallback or `Image.asset` for local placeholders. URL is a mock Google AI image.
3. **Material Symbols Icons:** Use Material Design Icons throughout (menu, search, location_on, storefront, add_shopping_cart, etc.).
4. **Dark Mode:** Design does not specify dark mode logic—assume light mode for now. DESIGN.md colors are for light.
5. **Responsive:** Home is mobile-first. Item Details has a 2-column desktop layout (use `LayoutBuilder` or MediaQuery to handle).
6. **No Error Handling:** UI is presentation-only; no loading/error states for now.
7. **build_runner:** Run `dart run build_runner build` after creating freezed models.

---

## Success Criteria

- ✅ Home screen matches mockup structure (search, trending, nearby stores, bottom nav)
- ✅ Item Details screen matches mockup structure (hero, info, price comparison)
- ✅ All colors, typography, and spacing follow DESIGN.md tokens exactly
- ✅ Tap product card from home → navigates to item details
- ✅ All fonts are Public Sans (from pubspec.yaml or system)
- ✅ Widgets are reusable and located in appropriate folders
- ✅ Code follows CLAUDE.md rules (const, no dynamic, sealed types for models)
- ✅ App runs without errors (`flutter run`)
