import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/result.dart';
import '../../domain/entities/store.dart';
import 'store_repository_provider.dart';

part 'store_provider.g.dart';

/// Fetches nearby stores.
@riverpod
Future<List<Store>> nearbyStores(Ref ref) async {
  final result = await ref.watch(storeRepositoryProvider).getNearbyStores();
  return switch (result) {
    Ok(:final value) => value,
    Err(:final failure) => throw Exception(failure.message),
  };
}

/// Fetches stores that carry a specific product by [productId].
@riverpod
Future<List<Store>> storesForProduct(Ref ref, String productId) async {
  final result =
      await ref.watch(storeRepositoryProvider).getStoresForProduct(productId);
  return switch (result) {
    Ok(:final value) => value,
    Err(:final failure) => throw Exception(failure.message),
  };
}
