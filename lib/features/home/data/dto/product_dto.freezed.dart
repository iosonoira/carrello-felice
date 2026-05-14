// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductDto {

 String get id; String get name; String get category; String get description; double get price; String get unit;@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'is_best_price') bool get isBestPrice;
/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDtoCopyWith<ProductDto> get copyWith => _$ProductDtoCopyWithImpl<ProductDto>(this as ProductDto, _$identity);

  /// Serializes this ProductDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isBestPrice, isBestPrice) || other.isBestPrice == isBestPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,description,price,unit,imageUrl,isBestPrice);

@override
String toString() {
  return 'ProductDto(id: $id, name: $name, category: $category, description: $description, price: $price, unit: $unit, imageUrl: $imageUrl, isBestPrice: $isBestPrice)';
}


}

/// @nodoc
abstract mixin class $ProductDtoCopyWith<$Res>  {
  factory $ProductDtoCopyWith(ProductDto value, $Res Function(ProductDto) _then) = _$ProductDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String category, String description, double price, String unit,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'is_best_price') bool isBestPrice
});




}
/// @nodoc
class _$ProductDtoCopyWithImpl<$Res>
    implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._self, this._then);

  final ProductDto _self;
  final $Res Function(ProductDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? description = null,Object? price = null,Object? unit = null,Object? imageUrl = null,Object? isBestPrice = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,isBestPrice: null == isBestPrice ? _self.isBestPrice : isBestPrice // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDto].
extension ProductDtoPatterns on ProductDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String description,  double price,  String unit, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'is_best_price')  bool isBestPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.description,_that.price,_that.unit,_that.imageUrl,_that.isBestPrice);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String description,  double price,  String unit, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'is_best_price')  bool isBestPrice)  $default,) {final _that = this;
switch (_that) {
case _ProductDto():
return $default(_that.id,_that.name,_that.category,_that.description,_that.price,_that.unit,_that.imageUrl,_that.isBestPrice);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String category,  String description,  double price,  String unit, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'is_best_price')  bool isBestPrice)?  $default,) {final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.description,_that.price,_that.unit,_that.imageUrl,_that.isBestPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDto implements ProductDto {
  const _ProductDto({required this.id, required this.name, required this.category, required this.description, required this.price, required this.unit, @JsonKey(name: 'image_url') required this.imageUrl, @JsonKey(name: 'is_best_price') required this.isBestPrice});
  factory _ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String category;
@override final  String description;
@override final  double price;
@override final  String unit;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey(name: 'is_best_price') final  bool isBestPrice;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDtoCopyWith<_ProductDto> get copyWith => __$ProductDtoCopyWithImpl<_ProductDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isBestPrice, isBestPrice) || other.isBestPrice == isBestPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,description,price,unit,imageUrl,isBestPrice);

@override
String toString() {
  return 'ProductDto(id: $id, name: $name, category: $category, description: $description, price: $price, unit: $unit, imageUrl: $imageUrl, isBestPrice: $isBestPrice)';
}


}

/// @nodoc
abstract mixin class _$ProductDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory _$ProductDtoCopyWith(_ProductDto value, $Res Function(_ProductDto) _then) = __$ProductDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String category, String description, double price, String unit,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'is_best_price') bool isBestPrice
});




}
/// @nodoc
class __$ProductDtoCopyWithImpl<$Res>
    implements _$ProductDtoCopyWith<$Res> {
  __$ProductDtoCopyWithImpl(this._self, this._then);

  final _ProductDto _self;
  final $Res Function(_ProductDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? description = null,Object? price = null,Object? unit = null,Object? imageUrl = null,Object? isBestPrice = null,}) {
  return _then(_ProductDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,isBestPrice: null == isBestPrice ? _self.isBestPrice : isBestPrice // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
