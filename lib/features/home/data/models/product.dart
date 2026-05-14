import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

/// Immutable data model representing a product with pricing and metadata.
@freezed
abstract class Product with _$Product {
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
