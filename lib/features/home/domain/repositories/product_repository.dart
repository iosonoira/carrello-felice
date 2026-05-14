import '../../../../core/error/result.dart';
import '../entities/product.dart';

/// Abstract contract for product data access.
///
/// Implementations live in the data layer and are never imported by presentation.
abstract interface class ProductRepository {
  /// Returns all available products.
  Future<Result<List<Product>>> getProducts();

  /// Returns a single product by [id], or [Err] with [NotFoundFailure] if absent.
  Future<Result<Product>> getProductById(String id);
}
