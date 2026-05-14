import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/store.dart';

part 'store_dto.freezed.dart';
part 'store_dto.g.dart';

/// Data Transfer Object for [Store].
///
/// Handles JSON serialization/deserialization from the remote API.
/// Use [toDomain] to convert to a domain [Store] entity.
@freezed
abstract class StoreDto with _$StoreDto {
  const factory StoreDto({
    required String id,
    required String name,
    required double distance,
    @JsonKey(name: 'hours_until') required String? hoursUntil,
    @JsonKey(name: 'is_open') required bool isOpen,
    @JsonKey(name: 'product_price') required double productPrice,
  }) = _StoreDto;

  factory StoreDto.fromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);
}

extension StoreDtoMapper on StoreDto {
  /// Maps this DTO to its domain [Store] entity.
  Store toDomain() => Store(
        id: id,
        name: name,
        distance: distance,
        hoursUntil: hoursUntil,
        isOpen: isOpen,
        productPrice: productPrice,
      );
}
