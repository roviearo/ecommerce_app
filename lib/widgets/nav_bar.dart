import 'package:ecommerce_app/cubit/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.pageIndex, required this.onTap});
  final int pageIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      padding: const EdgeInsets.all(0),
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withAlpha(50),
              offset: const Offset(0, -.5),
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            navItem(
              context,
              'home',
              'Home',
              pageIndex == 0,
              onTap: () => onTap(0),
            ),
            navItem(
              context,
              'chat',
              'Chat',
              pageIndex == 1,
              onTap: () => onTap(1),
            ),
            navItem(
              context,
              'cart',
              'Cart',
              pageIndex == 2,
              onTap: () => onTap(2),
            ),
            navItem(
              context,
              'profile',
              'Account',
              pageIndex == 3,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem(
    BuildContext context,
    String assetName,
    String label,
    bool selected, {
    Function()? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Badge(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  isLabelVisible: assetName == 'cart' && state.items.isNotEmpty,
                  label: Text(state.items.length.toString()),
                  child: SvgPicture.asset(
                    "icons/$assetName.svg",
                    colorFilter: ColorFilter.mode(
                      selected
                          ? Theme.of(context).iconTheme.color!
                          : Theme.of(context).disabledColor,
                      BlendMode.srcIn,
                    ),
                  ),
                );
              },
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: selected
                    ? Theme.of(context).iconTheme.color!
                    : Theme.of(context).disabledColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
