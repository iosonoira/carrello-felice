import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

/// Immutable data model representing a store location with pricing and availability.
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
