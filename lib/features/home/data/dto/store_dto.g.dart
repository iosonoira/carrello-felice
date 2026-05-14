// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreDto _$StoreDtoFromJson(Map<String, dynamic> json) => _StoreDto(
  id: json['id'] as String,
  name: json['name'] as String,
  distance: (json['distance'] as num).toDouble(),
  hoursUntil: json['hours_until'] as String?,
  isOpen: json['is_open'] as bool,
  productPrice: (json['product_price'] as num).toDouble(),
);

Map<String, dynamic> _$StoreDtoToJson(_StoreDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'distance': instance.distance,
  'hours_until': instance.hoursUntil,
  'is_open': instance.isOpen,
  'product_price': instance.productPrice,
};
