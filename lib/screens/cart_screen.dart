import 'package:ecommerce_app/cubit/cart/cart_cubit.dart';
import 'package:ecommerce_app/widgets/custom_icon.dart';
import 'package:ecommerce_app/widgets/product_cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).disabledColor),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Ship to: ',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                '626 Main Street ,Emily',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
              ),
              SvgPicture.asset(
                'icons/down.svg',
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
        actionsPadding: EdgeInsets.only(right: 10),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CartCubit>().clearCart();
            },
            icon: CustomIcon(assetUrl: 'icons/trash.svg'),
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'icons/cart_outline.svg',
                    width: 100,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).disabledColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    'Cart is empty',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                ],
              ),
            );
          }

          return Stack(
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              ListView.builder(
                itemCount: state.items.length,
                padding: EdgeInsets.only(bottom: 100),
                itemBuilder: (context, index) =>
                    ProductCartCard(cartItem: state.items[index]),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context).disabledColor.withAlpha(30),
                    ),
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: context.read<CartCubit>().allSelected,
                          onChanged: (value) {
                            context.read<CartCubit>().selectAllItem(value!);
                          },
                        ),
                        Text('All'),
                      ],
                    ),
                    SizedBox(height: 60, child: VerticalDivider()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Total'),
                        Text(
                          '\$${context.read<CartCubit>().total.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    Spacer(),
                    FilledButton(
                      onPressed:
                          state.items.any((element) => element.isSelected)
                          ? () {}
                          : null,
                      child: Text(
                        'Checkout(${context.read<CartCubit>().totalSelectedCartItem})',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
