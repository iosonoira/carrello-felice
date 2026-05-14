import 'package:go_router/go_router.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/home/presentation/screens/item_details_screen.dart';

/// Application router configuration using GoRouter.
///
/// Defines all routes in the application:
/// - `/`: HomeScreen (initial route)
/// - `/item/:id`: ItemDetailsScreen with productId parameter
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/item/:id',
      builder: (context, state) {
        final productId = state.pathParameters['id'] ?? '';
        return ItemDetailsScreen(productId: productId);
      },
    ),
  ],
);
