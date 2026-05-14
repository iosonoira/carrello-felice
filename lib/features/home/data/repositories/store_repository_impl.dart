import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/store.dart';
import '../../domain/repositories/store_repository.dart';
import '../datasources/store_datasource.dart';
import '../dto/store_dto.dart';

/// Concrete implementation of [StoreRepository].
///
/// Delegates to [StoreDatasource], catches data-layer exceptions,
/// and maps them to typed [Failure] values.
final class StoreRepositoryImpl implements StoreRepository {
  const StoreRepositoryImpl(this._datasource);

  final StoreDatasource _datasource;

  @override
  Future<Result<List<Store>>> getNearbyStores() async {
    try {
      final dtos = await _datasource.getNearbyStores();
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
  Future<Result<List<Store>>> getStoresForProduct(String productId) async {
    try {
      final dtos = await _datasource.getStoresForProduct(productId);
      return Ok(dtos.map((dto) => dto.toDomain()).toList());
    } on NetworkException catch (e) {
      return Err(NetworkFailure(e.message));
    } on ParseException catch (e) {
      return Err(ParseFailure(e.message));
    } catch (e) {
      return Err(UnexpectedFailure(e.toString(), error: e));
    }
  }
}
