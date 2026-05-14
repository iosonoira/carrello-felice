---
name: EcoPrice
colors:
  surface: '#f8f9fa'
  surface-dim: '#d9dadb'
  surface-bright: '#f8f9fa'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f3f4f5'
  surface-container: '#edeeef'
  surface-container-high: '#e7e8e9'
  surface-container-highest: '#e1e3e4'
  on-surface: '#191c1d'
  on-surface-variant: '#3d4a42'
  inverse-surface: '#2e3132'
  inverse-on-surface: '#f0f1f2'
  outline: '#6d7a72'
  outline-variant: '#bccac0'
  surface-tint: '#006c4a'
  primary: '#006948'
  on-primary: '#ffffff'
  primary-container: '#00855d'
  on-primary-container: '#f5fff7'
  inverse-primary: '#68dba9'
  secondary: '#43664d'
  on-secondary: '#ffffff'
  secondary-container: '#c2e9c9'
  on-secondary-container: '#486a51'
  tertiary: '#3f6353'
  on-tertiary: '#ffffff'
  tertiary-container: '#577c6b'
  on-tertiary-container: '#f5fff7'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#85f8c4'
  primary-fixed-dim: '#68dba9'
  on-primary-fixed: '#002114'
  on-primary-fixed-variant: '#005137'
  secondary-fixed: '#c5eccc'
  secondary-fixed-dim: '#aad0b1'
  on-secondary-fixed: '#00210e'
  on-secondary-fixed-variant: '#2c4e36'
  tertiary-fixed: '#c3ecd7'
  tertiary-fixed-dim: '#a8cfbc'
  on-tertiary-fixed: '#002115'
  on-tertiary-fixed-variant: '#294e3f'
  background: '#f8f9fa'
  on-background: '#191c1d'
  surface-variant: '#e1e3e4'
typography:
  headline-lg:
    fontFamily: Public Sans
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-lg-mobile:
    fontFamily: Public Sans
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 36px
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Public Sans
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  headline-sm:
    fontFamily: Public Sans
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Public Sans
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Public Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-md:
    fontFamily: Public Sans
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.05em
  label-sm:
    fontFamily: Public Sans
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  container-max: 1200px
  gutter: 16px
  margin-mobile: 16px
  margin-desktop: 40px
---

## Brand & Style
The brand personality of this design system is rooted in environmental stewardship, clarity, and organic elegance. It is designed for the conscious consumer who values both fiscal responsibility and ecological impact. The UI should evoke a sense of freshness and calm—reminiscent of a crisp morning at a local farmer's market.

The aesthetic follows a **Minimalist** approach with a **Modern Corporate** foundation to ensure reliability and trust. By utilizing significant white space and a palette derived from nature, the system prioritizes legibility and ease of use, ensuring that the complex task of price comparison feels effortless and rejuvenating rather than overwhelming.

## Colors
The color strategy uses a hierarchy of greens to establish a "naturalist" interface. 
- **Primary (Emerald):** Used for key calls to action and active states, providing a vibrant focal point.
- **Secondary (Sage):** A muted, sophisticated green used for secondary UI elements and supporting icons.
- **Tertiary (Mint):** High-lightness, low-saturation green used for subtle backgrounds, badge containers, and success states.
- **Surface:** A high-contrast, near-white gray (#F9FAFB) keeps the interface feeling airy and clean.
- **Typography:** Dark Forest Green (#064E3B) is used for all primary text to maintain high legibility while feeling softer and more "organic" than pure black.

## Typography
This design system utilizes **Public Sans** across all levels to maintain a clean, institutional, yet accessible feel. 
- **Headlines:** Use tighter letter spacing and bold weights in Forest Green to create a strong information hierarchy.
- **Body Text:** Standard weights with generous line-height ensure readability during long browsing sessions.
- **Labels:** Small caps or increased letter spacing are used sparingly for metadata (like unit prices) to differentiate from general descriptive text.

## Layout & Spacing
The layout relies on an **8px linear scale**, ensuring mathematical harmony between the rounded corners and the gaps between elements.
- **Grid:** A 12-column fluid grid is used for desktop, transitioning to a single-column layout for mobile. 
- **Gutters:** Standardized 16px gutters keep content distinct without breaking the flow of the eye.
- **Margins:** Mobile screens utilize a 16px side margin, while desktop views expand to 40px or center-align within a 1200px container to prevent excessive line lengths in typography.

## Elevation & Depth
Depth is conveyed through **Tonal Layering** and **Ambient Shadows** rather than harsh borders. 
- **Surface Tiers:** The base background is the lightest (#F9FAFB). Interactive cards use a pure white (#FFFFFF) background to "lift" them toward the user.
- **Shadows:** Use extremely soft, diffused shadows with a subtle green tint (e.g., `rgba(6, 78, 59, 0.05)`) to suggest elevation. Shadows should have a high blur radius (12px+) and low spread to maintain the minimalist aesthetic.
- **Outlines:** Non-interactive containers or subtle dividers should use a very low-contrast Sage outline (1px solid #E5E7EB) instead of shadows to keep the UI flat and modern.

## Shapes
In alignment with the "Eco" theme, this design system avoids sharp, aggressive angles. 
- **Core Radius:** All standard components (buttons, input fields, cards) feature a **0.5rem (8px)** corner radius.
- **Large Containers:** Modals and bottom sheets utilize **1.5rem (24px)** top-corner rounding to feel more approachable and modern.
- **Iconography:** Use rounded terminal ends for icons to match the softness of the typeface and the component corners.

## Components
- **Buttons:** Primary buttons are solid Emerald with white text. Secondary buttons use a Mint background with Forest Green text. All buttons have 8px rounded corners and 16px horizontal padding.
- **Cards:** White surfaces with a 1px Sage-tinted border or a very soft ambient shadow. Product cards should feature a prominent price display in Forest Green.
- **Chips:** Used for grocery categories (e.g., "Organic," "Local"). These use a Tertiary Mint background with a slightly darker Sage border and Label-sm typography.
- **Input Fields:** Search bars and quantity selectors should have a 1px Sage border that transitions to a 2px Emerald border on focus.
- **Progress Indicators:** Simple, thin bars in Emerald to show "Eco-savings" or "Price History."
- **Price Comparison Lists:** Use alternating row highlights in a very faint Mint tint to help users track data across large tables.