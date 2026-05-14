import 'models/product.dart';
import 'models/store.dart';

/// Mock product data for development and testing.
const mockProducts = <Product>[
  Product(
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
  Product(
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
  Product(
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

/// Mock store data for home screen.
const mockStores = <Store>[
  Store(
    id: 'store-1',
    name: 'GreenGrocer',
    distance: 0.5,
    hoursUntil: null,
    isOpen: true,
    productPrice: 0.0,
  ),
  Store(
    id: 'store-2',
    name: 'FreshMart',
    distance: 1.2,
    hoursUntil: 'Open until 10 PM',
    isOpen: true,
    productPrice: 0.0,
  ),
  Store(
    id: 'store-3',
    name: 'City Market',
    distance: 2.0,
    hoursUntil: 'Open until 9 PM',
    isOpen: true,
    productPrice: 0.0,
  ),
];

/// Selected product for item details screen demo (Hass Avocados).
const selectedProduct = Product(
  id: '3',
  name: 'Hass Avocados',
  category: 'Produce',
  description: 'Creamy, nutrient-rich Hass avocados from California',
  price: 1.25,
  unit: '/ea',
  imageUrl:
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDqenHNcgH-Tf6HwVg9l6WNlEc6hpnZrl3M4-iPR1FFoQPce1DMrJp-sxjl7OWSGhv6o5AGGoX5jybY79pNrGwCUPATWojKvetZEIF9XKWsAIUDEgz3vJEo2NcWc1F77PrDViwkm44hiUCFtY4S4-CfCitsnwqEcZb1KpP4Nb9iJvZvUPY4HzjUX42o60fksHGJyl3hDpeeBMIFiX-s1RXO2-2ClGf_uYzyW_2aVyn23nydT7nkzQsyVYbBuitAx-By7gcwecX85kg',
  isBestPrice: true,
);

/// Stores with prices for the selected product (Hass Avocados).
const storesForProduct = <Store>[
  Store(
    id: 'fresh-market',
    name: 'Fresh Market',
    distance: 1.2,
    hoursUntil: null,
    isOpen: true,
    productPrice: 3.99,
  ),
  Store(
    id: 'city-grocers',
    name: 'City Grocers',
    distance: 0.8,
    hoursUntil: null,
    isOpen: true,
    productPrice: 4.49,
  ),
  Store(
    id: 'organic-whole-foods',
    name: 'Organic Whole Foods',
    distance: 3.5,
    hoursUntil: null,
    isOpen: true,
    productPrice: 5.99,
  ),
];
