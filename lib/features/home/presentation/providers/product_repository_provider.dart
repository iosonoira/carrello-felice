import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/product_mock_datasource.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';

part 'product_repository_provider.g.dart';

/// Provides [ProductRepository] backed by the mock datasource.
@riverpod
ProductRepository productRepository(Ref ref) =>
    ProductRepositoryImpl(const ProductMockDatasource());
