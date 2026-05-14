import '../../../../core/error/result.dart';
import '../entities/store.dart';

/// Abstract contract for store data access.
///
/// Implementations live in the data layer and are never imported by presentation.
abstract interface class StoreRepository {
  /// Returns nearby stores sorted by distance.
  Future<Result<List<Store>>> getNearbyStores();

  /// Returns stores that carry the product identified by [productId],
  /// each with [Store.productPrice] populated.
  Future<Result<List<Store>>> getStoresForProduct(String productId);
}
