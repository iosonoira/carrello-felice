import '../dto/store_dto.dart';

/// Abstract contract for store data retrieval.
///
/// Implementations may be remote (Dio) or local (mock/cache).
/// Throws [NetworkException], [ParseException], or [NotFoundException] on failure.
abstract interface class StoreDatasource {
  Future<List<StoreDto>> getNearbyStores();
  Future<List<StoreDto>> getStoresForProduct(String productId);
}
