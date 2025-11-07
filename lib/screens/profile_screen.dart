import 'package:ecommerce_app/blocs/authentication/authentication_bloc.dart';
import 'package:ecommerce_app/cubit/theme/theme_cubit.dart';
import 'package:ecommerce_app/utils/router.dart';
import 'package:ecommerce_app/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        forceMaterialTransparency: true,
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          final user = (state as Authenticated).user;

          return SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.only(top: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          '${user.firstName} ${user.lastName}',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          user.email,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Divider(
                          height: 50,
                          thickness: 5,
                          color: Theme.of(context).disabledColor.withAlpha(40),
                        ),
                        GridView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                mainAxisExtent: 75,
                              ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  CustomIcon(
                                    assetUrl: 'icons/order.svg',
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimary,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'My Orders',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => router.pushNamed('wishlist'),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    CustomIcon(
                                      assetUrl: 'icons/favorite_outline.svg',
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Wishlist',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onPrimary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  CustomIcon(
                                    assetUrl: 'icons/car.svg',
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimary,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Delivering',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  CustomIcon(
                                    assetUrl: 'icons/review.svg',
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimary,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Reviews',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 50,
                          thickness: 5,
                          color: Theme.of(context).disabledColor.withAlpha(40),
                        ),
                        ListTile(
                          leading: CustomIcon(assetUrl: 'icons/profile.svg'),
                          title: Text(
                            'Edit Profile',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          trailing: CustomIcon(
                            assetUrl: 'icons/chevron_right.svg',
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: CustomIcon(assetUrl: 'icons/address.svg'),
                          title: Text(
                            'Address',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          trailing: CustomIcon(
                            assetUrl: 'icons/chevron_right.svg',
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: CustomIcon(assetUrl: 'icons/payment.svg'),
                          title: Row(
                            children: [
                              Text(
                                'Payment',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Credit Card',
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).disabledColor,
                                        ),
                                  ),
                                  Text(
                                    '9289760655481815',
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).disabledColor,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: CustomIcon(
                            assetUrl: 'icons/chevron_right.svg',
                          ),
                          onTap: () {},
                        ),
                        BlocBuilder<ThemeCubit, ThemeState>(
                          builder: (context, state) {
                            return ListTile(
                              leading: CustomIcon(assetUrl: 'icons/moon.svg'),
                              title: Text(
                                'Dark Mode',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              trailing: Switch.adaptive(
                                activeThumbColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                value: state.isDarkMode,
                                onChanged: (value) {
                                  context.read<ThemeCubit>().setDarkMode(value);
                                },
                              ),
                              onTap: () {
                                context.read<ThemeCubit>().setDarkMode(
                                  !state.isDarkMode,
                                );
                              },
                            );
                          },
                        ),
                        ListTile(
                          leading: CustomIcon(assetUrl: 'icons/shield.svg'),
                          title: Text(
                            'Security',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          trailing: CustomIcon(
                            assetUrl: 'icons/chevron_right.svg',
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: CustomIcon(assetUrl: 'icons/help.svg'),
                          title: Text(
                            'Help Center',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          trailing: CustomIcon(
                            assetUrl: 'icons/chevron_right.svg',
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: CustomIcon(
                            assetUrl: 'icons/logout.svg',
                            color: Theme.of(context).colorScheme.error,
                          ),
                          title: Text(
                            'Logout',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                          ),
                          trailing: CustomIcon(
                            assetUrl: 'icons/chevron_right.svg',
                            color: Theme.of(context).colorScheme.error,
                          ),
                          onTap: () {
                            context.read<AuthenticationBloc>().add(
                              SignOutEvent(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          maxRadius: 55,
                          backgroundColor: Theme.of(
                            context,
                          ).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            maxRadius: 50,
                            child: Image.network(
                              user.image,
                              fit: BoxFit.cover,
                              width: 50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
