import 'package:ecommerce_app/cubit/cart/cart_cubit.dart';
import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCartCard extends StatelessWidget {
  const ProductCartCard({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, top: 16),
        child: Row(
          children: [
            Center(
              child: Checkbox(
                value: cartItem.isSelected,
                onChanged: (value) {
                  context.read<CartCubit>().selectItem(cartItem.productId);
                },
              ),
            ),
            Image.network(
              cartItem.imageUrl,
              width: MediaQuery.sizeOf(context).width * .2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width:
                        MediaQuery.sizeOf(context).width -
                        (MediaQuery.sizeOf(context).width * .4),
                    child: Text(
                      cartItem.title,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  Text(
                    cartItem.brand ?? '',
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '\$${cartItem.price}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '\$${num.parse(cartItem.originalPrice.toStringAsFixed(2))}',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
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
                          '5%',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.read<CartCubit>().decreaseQuantity(
                          cartItem.productId,
                        ),
                        behavior: HitTestBehavior.opaque,
                        child: SvgPicture.asset('icons/remove.svg'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        cartItem.quantity.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => context.read<CartCubit>().increaseQuantity(
                          cartItem.productId,
                        ),
                        behavior: HitTestBehavior.opaque,
                        child: SvgPicture.asset('icons/add.svg'),
                      ),
                      Expanded(child: SizedBox.shrink()),
                      IconButton(
                        onPressed: () {
                          context.read<CartCubit>().removeItem(
                            cartItem.productId,
                          );
                        },
                        icon: SvgPicture.asset(
                          'icons/trash.svg',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).disabledColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
