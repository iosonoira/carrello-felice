import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

/// Data Transfer Object for [Product].
///
/// Handles JSON serialization/deserialization from the remote API.
/// Use [toDomain] to convert to a domain [Product] entity.
@freezed
abstract class ProductDto with _$ProductDto {
  const factory ProductDto({
    required String id,
    required String name,
    required String category,
    required String description,
    required double price,
    required String unit,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'is_best_price') required bool isBestPrice,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}

extension ProductDtoMapper on ProductDto {
  /// Maps this DTO to its domain [Product] entity.
  Product toDomain() => Product(
        id: id,
        name: name,
        category: category,
        description: description,
        price: price,
        unit: unit,
        imageUrl: imageUrl,
        isBestPrice: isBestPrice,
      );
}
