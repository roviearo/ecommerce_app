import 'dart:developer';

import 'package:ecommerce_app/cubit/wishlist/wishlist_cubit.dart';
import 'package:ecommerce_app/widgets/custom_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import 'package:ecommerce_app/cubit/cart/cart_cubit.dart';
import 'package:ecommerce_app/cubit/detail_product/detail_product_cubit.dart';
import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/widgets/custom_icon.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  int selectedImage = 0;

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
                forceMaterialTransparency: true,
                titleSpacing: 0,
                title: SizedBox(
                  height: 35,
                  child: TextField(
                    style: TextStyle(fontSize: 14),
                    readOnly: true,
                    decoration: InputDecoration(
                      hint: Text(
                        'Search',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SvgPicture.asset(
                          'icons/search.svg',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.outline,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(maxWidth: 30),
                    ),
                  ),
                ),
                actions: [
                  BlocBuilder<WishlistCubit, WishlistState>(
                    builder: (context, state) {
                      bool isFavorite = state.listProduct.any(
                        (element) => element.id == product.id,
                      );
                      log(isFavorite.toString());
                      log(state.listProduct.toString());
                      return IconButton(
                        onPressed: () {
                          context.read<WishlistCubit>().addProduct(product);
                        },
                        icon: isFavorite
                            ? CustomIcon(
                                assetUrl: 'icons/favorite.svg',
                                color: Colors.red,
                              )
                            : CustomIcon(
                                assetUrl: 'icons/favorite_outline.svg',
                              ),
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: CustomIcon(assetUrl: 'icons/share.svg'),
                  ),
                  SizedBox(width: 5),
                ],
              ),
              body: Stack(
                alignment: AlignmentGeometry.bottomCenter,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.network(
                            height: 300,
                            state.product!.images[selectedImage],
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
                                          loadingProgress.expectedTotalBytes !=
                                              null
                                          ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                          : null,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 75,
                          child: Center(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: product.images.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  if (selectedImage != index) {
                                    setState(() {
                                      selectedImage = index;
                                    });
                                  }
                                },
                                behavior: HitTestBehavior.opaque,
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: selectedImage == index ? 2 : 1,
                                      color: selectedImage == index
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.primary
                                          : Theme.of(context).disabledColor,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    state.product!.images[index],
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
                                                  loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                  : null,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            product.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: product.brand != null
                              ? Row(
                                  children: [
                                    Text('by '),
                                    Text(
                                      product.brand ?? '',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelLarge,
                                    ),
                                  ],
                                )
                              : SizedBox.shrink(),
                        ),
                        SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Text(
                                '\$${product.price}',
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
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
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.errorContainer,
                                ),
                                child: Text(
                                  '${product.discountPercentage}%',
                                  style: Theme.of(context).textTheme.labelLarge
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.error,
                                      ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                product.availabilityStatus ?? '',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context).disabledColor,
                                    ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                product.stock.toString(),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 40,
                          color: Theme.of(context).disabledColor.withAlpha(25),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  product.returnPolicy ?? '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  '  ·  ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  product.shippingInformation ?? '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).disabledColor,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.only(
                              left: 2,
                              top: 2,
                              bottom: 2,
                              right: 4,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                Text('${product.rating}'),
                                Text(
                                  ' (${product.reviews?.length})',
                                  style: TextStyle(
                                    color: Theme.of(context).disabledColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 20,
                          thickness: 5,
                          color: Theme.of(context).disabledColor.withAlpha(40),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Specification',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Category'),
                                      SizedBox(height: 10),
                                      Text('Brand'),
                                      SizedBox(height: 10),
                                      Text('Tags'),
                                      SizedBox(height: 10),
                                      Text('SKU'),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                  SizedBox(width: 30),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.category),
                                      SizedBox(height: 10),
                                      Text(product.brand ?? 'No brand'),
                                      SizedBox(height: 10),
                                      Row(
                                        children: List.generate(
                                          product.tags!.length,
                                          (index) => Text(
                                            '${product.tags![index]}${index != product.tags?.length ? ', ' : ''}',
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(product.sku ?? '-'),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(),
                              SizedBox(height: 10),
                              Text(
                                'Description',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(height: 20),
                              Text(product.description),
                              SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Theme.of(context).colorScheme.surface,
                    child: Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: CustomIcon(
                            assetUrl: 'icons/chat.svg',
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text('Buy Now'),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                useSafeArea: true,
                                isScrollControlled: true,
                                builder: (context) => FractionallySizedBox(
                                  heightFactor: .7,
                                  child: CustomModalBottomSheet(
                                    product: state.product!,
                                  ),
                                ),
                              );
                              context.read<CartCubit>().addItem(
                                CartItemModel(
                                  productId: product.id,
                                  title: product.title,
                                  brand: product.brand,
                                  imageUrl: product.thumbnail,
                                  price: product.price,
                                  discountPercentage:
                                      product.discountPercentage,
                                  originalPrice: originalPrice,
                                ),
                              );
                            },
                            child: Text('Add to Cart'),
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

        return Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: CustomIcon(assetUrl: 'icons/favorite_outline.svg'),
              ),
              IconButton(
                onPressed: () {},
                icon: CustomIcon(assetUrl: 'icons/share.svg'),
              ),
              SizedBox(width: 5),
            ],
            titleSpacing: 0,
            title: SizedBox(
              height: 35,
              child: TextField(
                style: TextStyle(fontSize: 14),
                readOnly: true,
                decoration: InputDecoration(
                  hint: Text(
                    'Search',
                    style: TextStyle(color: Theme.of(context).disabledColor),
                  ),
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(
                      'icons/search.svg',
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.outline,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(maxWidth: 30),
                ),
              ),
            ),
          ),
          body: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 300,
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  width: double.infinity,
                  height: 30,
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  width: MediaQuery.sizeOf(context).width * .5,
                  height: 20,
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  width: MediaQuery.sizeOf(context).width * .25,
                  height: 30,
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  width: MediaQuery.sizeOf(context).width * .5,
                  height: 30,
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  width: double.infinity,
                  height: 20,
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  width: double.infinity,
                  height: 20,
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  width: double.infinity,
                  height: 20,
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  width: double.infinity,
                  height: 20,
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  width: double.infinity,
                  height: 20,
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  width: MediaQuery.sizeOf(context).width * .25,
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
