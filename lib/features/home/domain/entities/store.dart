import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

/// Domain entity representing a store location.
///
/// [productPrice] is the price of the queried product at this store.
/// Zero means no product price has been loaded yet.
@freezed
abstract class Store with _$Store {
  const factory Store({
    required String id,
    required String name,
    required double distance,
    required String? hoursUntil,
    required bool isOpen,
    required double productPrice,
  }) = _Store;
}
