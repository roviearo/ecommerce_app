import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/widgets/category_card.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:ecommerce_app/widgets/title_large_medium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              height: 40,
              child: TextField(
                style: TextStyle(fontSize: 14),
                readOnly: true,
                decoration: InputDecoration(
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
          actionsPadding: EdgeInsets.only(right: 10),
          actions: [
            IconButton(
              onPressed: () {},
              icon: CustomIcon(assetUrl: 'icons/bell.svg'),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 100.0,
                      viewportFraction: .9,
                      autoPlay: true,
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.tertiaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Promo $i',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onTertiaryContainer,
                                    ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                TitleLargeMedium(title: 'Categories'),
                SizedBox(
                  height: 95,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      CategoryCard(imageUrl: 'images/men.png', title: 'Men'),
                      CategoryCard(
                        imageUrl: 'images/women.png',
                        title: 'Women',
                      ),
                      CategoryCard(
                        imageUrl: 'images/jewel.png',
                        title: 'Jewelery',
                      ),
                      CategoryCard(
                        imageUrl: 'images/electronic.png',
                        title: 'Electronics',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TitleLargeMedium(title: 'Flash Sale 12.12'),
                SizedBox(
                  height: 268,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      ProductCard(
                        imageUrl:
                            'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png',
                        price: 109.95,
                        rating: 3.9,
                        reviews: 120,
                        title:
                            'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
                      ),
                      SizedBox(width: 16),
                      ProductCard(
                        imageUrl:
                            "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png",
                        price: 22.3,
                        rating: 4.1,
                        reviews: 259,
                        title: 'Mens Casual Premium Slim Fit T-Shirts',
                      ),
                      SizedBox(width: 16),
                      ProductCard(
                        imageUrl:
                            'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png',
                        price: 109.95,
                        rating: 3.9,
                        reviews: 120,
                        title:
                            'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
                      ),
                      SizedBox(width: 16),
                      ProductCard(
                        imageUrl:
                            "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png",
                        price: 22.3,
                        rating: 4.1,
                        reviews: 259,
                        title: 'Mens Casual Premium Slim Fit T-Shirts',
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Recomended for you',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 268,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  addRepaintBoundaries: true,
                  children: [
                    ProductCard(
                      imageUrl:
                          'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png',
                      price: 109.95,
                      rating: 3.9,
                      reviews: 120,
                      title:
                          'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
                    ),
                    ProductCard(
                      imageUrl:
                          "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png",
                      price: 22.3,
                      rating: 4.1,
                      reviews: 259,
                      title: 'Mens Casual Premium Slim Fit T-Shirts',
                    ),
                    ProductCard(
                      imageUrl:
                          'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png',
                      price: 109.95,
                      rating: 3.9,
                      reviews: 120,
                      title:
                          'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
                    ),
                    ProductCard(
                      imageUrl:
                          "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png",
                      price: 22.3,
                      rating: 4.1,
                      reviews: 259,
                      title: 'Mens Casual Premium Slim Fit T-Shirts',
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.assetUrl, this.color});

  final String assetUrl;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetUrl,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).colorScheme.onSurface,
        BlendMode.srcIn,
      ),
    );
  }
}
