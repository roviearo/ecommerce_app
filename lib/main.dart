import 'package:ecommerce_app/blocs/authentication/authentication_bloc.dart';
import 'package:ecommerce_app/blocs/category/category_bloc.dart';
import 'package:ecommerce_app/blocs/product/product_bloc.dart';
import 'package:ecommerce_app/cubit/cart/cart_cubit.dart';
import 'package:ecommerce_app/cubit/detail_product/detail_product_cubit.dart';
import 'package:ecommerce_app/cubit/products_by_category/products_by_category_cubit.dart';
import 'package:ecommerce_app/cubit/search_product/search_product_cubit.dart';
import 'package:ecommerce_app/cubit/theme/theme_cubit.dart';
import 'package:ecommerce_app/cubit/wishlist/wishlist_cubit.dart';
import 'package:ecommerce_app/repositories/auth_repository.dart';
import 'package:ecommerce_app/repositories/category_repository.dart';
import 'package:ecommerce_app/repositories/product_repository.dart';
import 'package:ecommerce_app/utils/router.dart';
import 'package:ecommerce_app/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => ProductRepository()),
        RepositoryProvider(create: (context) => CategoryRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthenticationBloc(repository: context.read<AuthRepository>())
                  ..add(AppStarted()),
          ),
          BlocProvider(create: (context) => WishlistCubit()),
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(
            create: (context) => SearchProductCubit(
              repository: context.read<ProductRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => ProductBloc(
              productRepository: context.read<ProductRepository>(),
            )..add(LoadAllProductsEvent()),
          ),
          BlocProvider(
            create: (context) => DetailProductCubit(
              productRepository: context.read<ProductRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(
              categoryRepository: context.read<CategoryRepository>(),
            )..add(LoadAllCategoryEvent()),
          ),
          BlocProvider(
            create: (context) => ProductsByCategoryCubit(
              productRepository: context.read<ProductRepository>(),
            ),
          ),
          BlocProvider(create: (context) => CartCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              routeInformationProvider: router.routeInformationProvider,
              title: 'Ecommerce App',
              debugShowCheckedModeBanner: false,
              themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: lightColorScheme,
                fontFamily: 'Poppins',
                filledButtonTheme: FilledButtonThemeData(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5),
                      ),
                    ),
                  ),
                ),
                outlinedButtonTheme: OutlinedButtonThemeData(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: darkColorScheme,
                fontFamily: 'Inter',
                filledButtonTheme: FilledButtonThemeData(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5),
                      ),
                    ),
                  ),
                ),
                outlinedButtonTheme: OutlinedButtonThemeData(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
