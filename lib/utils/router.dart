import 'package:ecommerce_app/main_screen.dart';
import 'package:ecommerce_app/screens/detail_product_screen.dart';
import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:ecommerce_app/screens/products_by_category_screen.dart';
import 'package:ecommerce_app/screens/search_screen.dart';
import 'package:ecommerce_app/screens/splash_screen.dart';
import 'package:ecommerce_app/screens/wishlist_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/main',
      name: 'main',
      builder: (context, state) =>
          MainScreen(index: state.uri.queryParameters['index']),
      routes: [
        GoRoute(
          path: 'detail_product',
          name: 'detail_product',
          builder: (context, state) => DetailProductScreen(),
        ),
        GoRoute(
          path: 'products_by_category',
          name: 'products_by_category',
          builder: (context, state) => ProductsByCategoryScreen(
            category: state.uri.queryParameters['category'],
          ),
        ),
        GoRoute(
          path: 'wishlist',
          name: 'wishlist',
          builder: (context, state) => WishlistScreen(),
        ),
        GoRoute(
          path: 'search',
          name: 'search',
          builder: (context, state) => SearchScreen(),
        ),
      ],
    ),
  ],
);
