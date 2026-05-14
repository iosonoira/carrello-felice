import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/result.dart';
import '../../domain/entities/product.dart';
import 'product_repository_provider.dart';

part 'product_provider.g.dart';

/// Fetches the full product list.
@riverpod
Future<List<Product>> products(Ref ref) async {
  final result = await ref.watch(productRepositoryProvider).getProducts();
  return switch (result) {
    Ok(:final value) => value,
    Err(:final failure) => throw Exception(failure.message),
  };
}

/// Fetches a single product by [productId].
@riverpod
Future<Product> productDetail(Ref ref, String productId) async {
  final result =
      await ref.watch(productRepositoryProvider).getProductById(productId);
  return switch (result) {
    Ok(:final value) => value,
    Err(:final failure) => throw Exception(failure.message),
  };
}
