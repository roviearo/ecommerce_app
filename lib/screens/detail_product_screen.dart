import 'package:ecommerce_app/cubit/detail_product/detail_product_cubit.dart';
import 'package:ecommerce_app/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailProductCubit, DetailProductState>(
      builder: (context, state) {
        if (state.product != null) {
          final product = state.product!;
          final originalPrice =
              product.price / (1 - product.discountPercentage / 100);

          return PopScope(
            canPop: true,
            onPopInvokedWithResult: (didPop, result) {
              if (!didPop) {
                Navigator.pop(context);
              }
              context.read<DetailProductCubit>().removeDetailProduct();
            },
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: CustomIcon(assetUrl: 'icons/favorite_outline.svg'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: CustomIcon(assetUrl: 'icons/share.svg'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: CustomIcon(assetUrl: 'icons/cart_outline.svg'),
                  ),
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      state.product!.images[0],
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: CircularProgressIndicator(
                                color: Colors.black,
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      product.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text('by '),
                        Text(
                          product.brand ?? 'loading',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Text(
                          '\$${product.price}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '\$${num.parse(originalPrice.toStringAsFixed(2))}',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: Theme.of(context).disabledColor,
                              ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Theme.of(context).colorScheme.errorContainer,
                          ),
                          child: Text(
                            '${product.discountPercentage.toInt()}%',
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Scaffold(body: Center(child: Text('Error')));
      },
    );
  }
}
