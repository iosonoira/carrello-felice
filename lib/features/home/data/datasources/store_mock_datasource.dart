import '../dto/store_dto.dart';
import 'store_datasource.dart';

/// Mock implementation of [StoreDatasource] for development and testing.
final class StoreMockDatasource implements StoreDatasource {
  static const _nearbyStores = <StoreDto>[
    StoreDto(
      id: 'store-1',
      name: 'GreenGrocer',
      distance: 0.5,
      hoursUntil: null,
      isOpen: true,
      productPrice: 0.0,
    ),
    StoreDto(
      id: 'store-2',
      name: 'FreshMart',
      distance: 1.2,
      hoursUntil: 'Open until 10 PM',
      isOpen: true,
      productPrice: 0.0,
    ),
    StoreDto(
      id: 'store-3',
      name: 'City Market',
      distance: 2.0,
      hoursUntil: 'Open until 9 PM',
      isOpen: true,
      productPrice: 0.0,
    ),
  ];

  static const _storesByProduct = <String, List<StoreDto>>{
    '3': [
      StoreDto(
        id: 'fresh-market',
        name: 'Fresh Market',
        distance: 1.2,
        hoursUntil: null,
        isOpen: true,
        productPrice: 3.99,
      ),
      StoreDto(
        id: 'city-grocers',
        name: 'City Grocers',
        distance: 0.8,
        hoursUntil: null,
        isOpen: true,
        productPrice: 4.49,
      ),
      StoreDto(
        id: 'organic-whole-foods',
        name: 'Organic Whole Foods',
        distance: 3.5,
        hoursUntil: null,
        isOpen: true,
        productPrice: 5.99,
      ),
    ],
  };

  @override
  Future<List<StoreDto>> getNearbyStores() async => _nearbyStores;

  @override
  Future<List<StoreDto>> getStoresForProduct(String productId) async =>
      _storesByProduct[productId] ?? const [];
}
