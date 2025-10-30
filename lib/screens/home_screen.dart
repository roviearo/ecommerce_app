import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/blocs/category/category_bloc.dart';
import 'package:ecommerce_app/blocs/product/product_bloc.dart';
import 'package:ecommerce_app/widgets/category_card.dart';
import 'package:ecommerce_app/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:ecommerce_app/widgets/title_large_medium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'images/promo$i.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                TitleLargeMedium(title: 'Categories'),
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is AllCategoryLoaded) {
                      final listCategory = state.listCategory;

                      return SizedBox(
                        height: 110,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          children: List.generate(
                            6,
                            (index) =>
                                CategoryCard(category: listCategory[index]),
                          ),
                        ),
                      );
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: SizedBox(
                          height: 50,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            children: List.generate(
                              6,
                              (index) => Container(
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 50,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                TitleLargeMedium(title: 'Flash Sale 12.12'),
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is AllProductsLoaded) {
                      final listProducts = state.listProduct;

                      return SizedBox(
                        height: 310,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          children: List.generate(
                            6,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: ProductCard(
                                id: listProducts[index].id,
                                imageUrl: listProducts[index].thumbnail,
                                price: listProducts[index].price,
                                rating: listProducts[index].rating,
                                reviews: listProducts[index].reviews!.length,
                                title: listProducts[index].title,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: SizedBox(
                          height: 150,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            children: List.generate(
                              6,
                              (index) => Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 150,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Recomended for you',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is AllProductsLoaded) {
                      final listProducts = state.listProduct;

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
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: GridView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                mainAxisExtent: 150,
                              ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          addRepaintBoundaries: true,
                          children: List.generate(
                            6,
                            (index) => Container(
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: double.infinity,
                              height: 150,
                            ),
                          ),
                        ),
                      );
                    }
                  },
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
