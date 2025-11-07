import 'package:ecommerce_app/cubit/wishlist/wishlist_cubit.dart';
import 'package:ecommerce_app/widgets/custom_icon.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text('My Wishlist'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CustomIcon(assetUrl: 'icons/trash.svg'),
          ),
        ],
      ),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          final listProducts = state.listProduct;
          if (listProducts.isEmpty) {
            return Center(child: Text('Wishlist is empty'));
          }
          return GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 310,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16),
            addRepaintBoundaries: true,
            children: List.generate(
              listProducts.length,
              (index) => ProductCard(
                id: listProducts[index].id,
                imageUrl: listProducts[index].thumbnail,
                price: listProducts[index].price,
                rating: listProducts[index].rating,
                reviews: listProducts[index].reviews!.length,
                title: listProducts[index].title,
              ),
            ),
          );
        },
      ),
    );
  }
}
