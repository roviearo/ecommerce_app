import 'package:ecommerce_app/main_screen.dart';
import 'package:ecommerce_app/screens/detail_product_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'main',
      builder: (context, state) => MainScreen(),
      routes: [
        GoRoute(
          path: 'detail_product',
          name: 'detail_product',
          builder: (context, state) => DetailProductScreen(),
        ),
      ],
    ),
  ],
);
