import '../dto/product_dto.dart';

/// Abstract contract for product data retrieval.
///
/// Implementations may be remote (Dio) or local (mock/cache).
/// Throws [NetworkException], [ParseException], or [NotFoundException] on failure.
abstract interface class ProductDatasource {
  Future<List<ProductDto>> getProducts();
  Future<ProductDto> getProductById(String id);
}
