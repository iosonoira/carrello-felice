import '../../../../core/error/exceptions.dart';
import '../dto/product_dto.dart';
import 'product_datasource.dart';

/// Mock implementation of [ProductDatasource] for development and testing.
final class ProductMockDatasource implements ProductDatasource {
  static const _products = <ProductDto>[
    ProductDto(
      id: '1',
      name: 'Organic Bananas',
      category: 'Produce',
      description: 'Fresh, ripe organic bananas from local farms',
      price: 0.59,
      unit: '/lb',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBW8hpSEARAUxXQjWCtdLdSb1YfwXCigQFSmFZBFCoU2n6v5aewULHtZY4guoGKMyI3f9UASKKH8SpMQICIBdOItBdzl3ZGxE61b30G1X4ouEQOR9yKUEdBvHt-2blM6Ty9_90F8LFKVts9pmdWJ4iOpDr1fNlEmeLPR8wcMfOsW4TfAUHJUfT1mHlaC9f9Qo8viKX4cEKidqSf8YRQ6NIZ2d-av4DezerU2YqITHTU6mEp0TVDwntqyRdzTHK5mWG_2eZ8gGgK_Tk',
      isBestPrice: true,
    ),
    ProductDto(
      id: '2',
      name: 'Almond Milk',
      category: 'Dairy Alt',
      description: 'Unsweetened, creamy almond milk alternative',
      price: 3.49,
      unit: '/ea',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDS9ogoj_zfGz1IWUdWnZNVioPmO2QObEWz1aPR0lC-6BWFH198L609iKxy0BMr1oAXQcqLaV1FNsDdVAi8SBkGArY8aXPHelghbTeVJrmDTahVXJk2HHF-zlXF5FyT1S30JteedMxfclqL9nb7KKAazZnsGiT9vUxmvgCqyU9DNNckcIwiPYwnxypVKqnRB64rdhQFP0_ybJk0LXedK4qVrsOJ7uWSCYgvWEIci9RMOcjKgWVY-Rt1jDislpwXij_ax0NydU88ZmM',
      isBestPrice: false,
    ),
    ProductDto(
      id: '3',
      name: 'Hass Avocados',
      category: 'Produce',
      description: 'Creamy, nutrient-rich Hass avocados from California',
      price: 1.25,
      unit: '/ea',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCpaSeHa12Oj_naAl-SbWrTwhzC-OyGLuLhLLOrJup952wuIov1AA2U_YjVun1oZUgPBhBSYY9e5SBHAV7omZAHSF9Iqqiud5Jmo0bjQ8f_nqSQPFXK4USD97wGVU9T6Sw5UMAbFu6IU-9ncjNVBLvKlFsq9tRuZ7jbLuqkPNgLeU_Wvt45cTJSZFel59NVWiXDrXD1DJNhaM_W-8bZIDE_9G1cMPQM6t6cgCaLoVXLSGo__syaf1yfTjPHWlBLTtn5aURM9WFQa3s',
      isBestPrice: true,
    ),
  ];

  @override
  Future<List<ProductDto>> getProducts() async => _products;

  @override
  Future<ProductDto> getProductById(String id) async {
    try {
      return _products.firstWhere((p) => p.id == id);
    } on StateError {
      throw NotFoundException('Product not found: $id');
    }
  }
}
