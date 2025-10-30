import 'package:ecommerce_app/cubit/products_by_category/products_by_category_cubit.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.read<ProductsByCategoryCubit>().loadProductsbyCategory(
          category.slug,
        );
        router.pushNamed(
          'products_by_category',
          queryParameters: {'category': category.slug},
        );
      },
      child: Column(
        children: [
          Card(
            elevation: .1,
            child: Container(
              width: 60,
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5,
              ),
              child: Center(
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'icons/${category.slug}.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(
              category.name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
