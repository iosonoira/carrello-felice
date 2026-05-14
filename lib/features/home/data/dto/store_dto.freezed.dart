// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoreDto {

 String get id; String get name; double get distance;@JsonKey(name: 'hours_until') String? get hoursUntil;@JsonKey(name: 'is_open') bool get isOpen;@JsonKey(name: 'product_price') double get productPrice;
/// Create a copy of StoreDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreDtoCopyWith<StoreDto> get copyWith => _$StoreDtoCopyWithImpl<StoreDto>(this as StoreDto, _$identity);

  /// Serializes this StoreDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.hoursUntil, hoursUntil) || other.hoursUntil == hoursUntil)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,distance,hoursUntil,isOpen,productPrice);

@override
String toString() {
  return 'StoreDto(id: $id, name: $name, distance: $distance, hoursUntil: $hoursUntil, isOpen: $isOpen, productPrice: $productPrice)';
}


}

/// @nodoc
abstract mixin class $StoreDtoCopyWith<$Res>  {
  factory $StoreDtoCopyWith(StoreDto value, $Res Function(StoreDto) _then) = _$StoreDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, double distance,@JsonKey(name: 'hours_until') String? hoursUntil,@JsonKey(name: 'is_open') bool isOpen,@JsonKey(name: 'product_price') double productPrice
});




}
/// @nodoc
class _$StoreDtoCopyWithImpl<$Res>
    implements $StoreDtoCopyWith<$Res> {
  _$StoreDtoCopyWithImpl(this._self, this._then);

  final StoreDto _self;
  final $Res Function(StoreDto) _then;

/// Create a copy of StoreDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? distance = null,Object? hoursUntil = freezed,Object? isOpen = null,Object? productPrice = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,hoursUntil: freezed == hoursUntil ? _self.hoursUntil : hoursUntil // ignore: cast_nullable_to_non_nullable
as String?,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,productPrice: null == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreDto].
extension StoreDtoPatterns on StoreDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreDto value)  $default,){
final _that = this;
switch (_that) {
case _StoreDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreDto value)?  $default,){
final _that = this;
switch (_that) {
case _StoreDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  double distance, @JsonKey(name: 'hours_until')  String? hoursUntil, @JsonKey(name: 'is_open')  bool isOpen, @JsonKey(name: 'product_price')  double productPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreDto() when $default != null:
return $default(_that.id,_that.name,_that.distance,_that.hoursUntil,_that.isOpen,_that.productPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  double distance, @JsonKey(name: 'hours_until')  String? hoursUntil, @JsonKey(name: 'is_open')  bool isOpen, @JsonKey(name: 'product_price')  double productPrice)  $default,) {final _that = this;
switch (_that) {
case _StoreDto():
return $default(_that.id,_that.name,_that.distance,_that.hoursUntil,_that.isOpen,_that.productPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  double distance, @JsonKey(name: 'hours_until')  String? hoursUntil, @JsonKey(name: 'is_open')  bool isOpen, @JsonKey(name: 'product_price')  double productPrice)?  $default,) {final _that = this;
switch (_that) {
case _StoreDto() when $default != null:
return $default(_that.id,_that.name,_that.distance,_that.hoursUntil,_that.isOpen,_that.productPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreDto implements StoreDto {
  const _StoreDto({required this.id, required this.name, required this.distance, @JsonKey(name: 'hours_until') required this.hoursUntil, @JsonKey(name: 'is_open') required this.isOpen, @JsonKey(name: 'product_price') required this.productPrice});
  factory _StoreDto.fromJson(Map<String, dynamic> json) => _$StoreDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  double distance;
@override@JsonKey(name: 'hours_until') final  String? hoursUntil;
@override@JsonKey(name: 'is_open') final  bool isOpen;
@override@JsonKey(name: 'product_price') final  double productPrice;

/// Create a copy of StoreDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreDtoCopyWith<_StoreDto> get copyWith => __$StoreDtoCopyWithImpl<_StoreDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.hoursUntil, hoursUntil) || other.hoursUntil == hoursUntil)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,distance,hoursUntil,isOpen,productPrice);

@override
String toString() {
  return 'StoreDto(id: $id, name: $name, distance: $distance, hoursUntil: $hoursUntil, isOpen: $isOpen, productPrice: $productPrice)';
}


}

/// @nodoc
abstract mixin class _$StoreDtoCopyWith<$Res> implements $StoreDtoCopyWith<$Res> {
  factory _$StoreDtoCopyWith(_StoreDto value, $Res Function(_StoreDto) _then) = __$StoreDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double distance,@JsonKey(name: 'hours_until') String? hoursUntil,@JsonKey(name: 'is_open') bool isOpen,@JsonKey(name: 'product_price') double productPrice
});




}
/// @nodoc
class __$StoreDtoCopyWithImpl<$Res>
    implements _$StoreDtoCopyWith<$Res> {
  __$StoreDtoCopyWithImpl(this._self, this._then);

  final _StoreDto _self;
  final $Res Function(_StoreDto) _then;

/// Create a copy of StoreDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? distance = null,Object? hoursUntil = freezed,Object? isOpen = null,Object? productPrice = null,}) {
  return _then(_StoreDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,hoursUntil: freezed == hoursUntil ? _self.hoursUntil : hoursUntil // ignore: cast_nullable_to_non_nullable
as String?,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,productPrice: null == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
