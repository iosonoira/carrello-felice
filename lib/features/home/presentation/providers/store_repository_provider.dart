import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/store_mock_datasource.dart';
import '../../data/repositories/store_repository_impl.dart';
import '../../domain/repositories/store_repository.dart';

part 'store_repository_provider.g.dart';

/// Provides [StoreRepository] backed by the mock datasource.
@riverpod
StoreRepository storeRepository(Ref ref) =>
    StoreRepositoryImpl(const StoreMockDatasource());
