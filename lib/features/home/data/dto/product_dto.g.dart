// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => _ProductDto(
  id: json['id'] as String,
  name: json['name'] as String,
  category: json['category'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
  unit: json['unit'] as String,
  imageUrl: json['image_url'] as String,
  isBestPrice: json['is_best_price'] as bool,
);

Map<String, dynamic> _$ProductDtoToJson(_ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'description': instance.description,
      'price': instance.price,
      'unit': instance.unit,
      'image_url': instance.imageUrl,
      'is_best_price': instance.isBestPrice,
    };
