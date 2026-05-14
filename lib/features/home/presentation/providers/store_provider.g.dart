// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Fetches nearby stores.

@ProviderFor(nearbyStores)
final nearbyStoresProvider = NearbyStoresProvider._();

/// Fetches nearby stores.

final class NearbyStoresProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Store>>,
          List<Store>,
          FutureOr<List<Store>>
        >
    with $FutureModifier<List<Store>>, $FutureProvider<List<Store>> {
  /// Fetches nearby stores.
  NearbyStoresProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nearbyStoresProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nearbyStoresHash();

  @$internal
  @override
  $FutureProviderElement<List<Store>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Store>> create(Ref ref) {
    return nearbyStores(ref);
  }
}

String _$nearbyStoresHash() => r'93653c521f47bc7e5a707f0b54c53d6fffe84252';

/// Fetches stores that carry a specific product by [productId].

@ProviderFor(storesForProduct)
final storesForProductProvider = StoresForProductFamily._();

/// Fetches stores that carry a specific product by [productId].

final class StoresForProductProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Store>>,
          List<Store>,
          FutureOr<List<Store>>
        >
    with $FutureModifier<List<Store>>, $FutureProvider<List<Store>> {
  /// Fetches stores that carry a specific product by [productId].
  StoresForProductProvider._({
    required StoresForProductFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'storesForProductProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storesForProductHash();

  @override
  String toString() {
    return r'storesForProductProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Store>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Store>> create(Ref ref) {
    final argument = this.argument as String;
    return storesForProduct(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StoresForProductProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storesForProductHash() => r'2f37c8486ed09c9aa90bee7bfbc2252f94fd4c3c';

/// Fetches stores that carry a specific product by [productId].

final class StoresForProductFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Store>>, String> {
  StoresForProductFamily._()
    : super(
        retry: null,
        name: r'storesForProductProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Fetches stores that carry a specific product by [productId].

  StoresForProductProvider call(String productId) =>
      StoresForProductProvider._(argument: productId, from: this);

  @override
  String toString() => r'storesForProductProvider';
}
