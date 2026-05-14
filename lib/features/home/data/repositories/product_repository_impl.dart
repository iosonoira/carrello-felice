import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_datasource.dart';
import '../dto/product_dto.dart';

/// Concrete implementation of [ProductRepository].
///
/// Delegates to [ProductDatasource], catches data-layer exceptions,
/// and maps them to typed [Failure] values.
final class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl(this._datasource);

  final ProductDatasource _datasource;

  @override
  Future<Result<List<Product>>> getProducts() async {
    try {
      final dtos = await _datasource.getProducts();
      return Ok(dtos.map((dto) => dto.toDomain()).toList());
    } on NetworkException catch (e) {
      return Err(NetworkFailure(e.message));
    } on ParseException catch (e) {
      return Err(ParseFailure(e.message));
    } catch (e) {
      return Err(UnexpectedFailure(e.toString(), error: e));
    }
  }

  @override
  Future<Result<Product>> getProductById(String id) async {
    try {
      final dto = await _datasource.getProductById(id);
      return Ok(dto.toDomain());
    } on NotFoundException catch (e) {
      return Err(NotFoundFailure(e.message));
    } on NetworkException catch (e) {
      return Err(NetworkFailure(e.message));
    } on ParseException catch (e) {
      return Err(ParseFailure(e.message));
    } catch (e) {
      return Err(UnexpectedFailure(e.toString(), error: e));
    }
  }
}
