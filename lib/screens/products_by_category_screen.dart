import 'package:ecommerce_app/blocs/category/category_bloc.dart';
import 'package:ecommerce_app/cubit/products_by_category/products_by_category_cubit.dart';
import 'package:ecommerce_app/widgets/custom_icon.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  const ProductsByCategoryScreen({super.key, required this.category});

  final String? category;

  @override
  State<ProductsByCategoryScreen> createState() =>
      _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is AllCategoryLoaded) {
          final listCategory = state.listCategory;

          return DefaultTabController(
            length: listCategory.length,
            initialIndex: listCategory.indexOf(
              listCategory.firstWhere(
                (element) => element.slug == widget.category,
              ),
            ),
            child: Scaffold(
              appBar: AppBar(
                forceMaterialTransparency: true,
                titleSpacing: 0,
                title: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SizedBox(
                    height: 35,
                    child: TextField(
                      style: TextStyle(fontSize: 14),
                      readOnly: true,
                      decoration: InputDecoration(
                        hint: Text(
                          'Search',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
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
                ),
                actionsPadding: EdgeInsets.only(right: 10),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: CustomIcon(assetUrl: 'icons/bell.svg'),
                  ),
                ],
                bottom: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: listCategory
                      .map((category) => Tab(text: category.name))
                      .toList(),
                  onTap: (index) {
                    context
                        .read<ProductsByCategoryCubit>()
                        .loadProductsbyCategory(listCategory[index].slug);
                  },
                ),
              ),
              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: listCategory.map((category) {
                  return BlocBuilder<
                    ProductsByCategoryCubit,
                    ProductsByCategoryState
                  >(
                    builder: (context, state) {
                      if (state.status == ProductsByCategoryStatus.loaded) {
                        final listProducts = state.listProduct;

                        return GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                mainAxisExtent: 310,
                              ),
                          padding: EdgeInsets.all(16),
                          addRepaintBoundaries: true,
                          children: List.generate(
                            listProducts!.length,
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
                                  mainAxisExtent: 180,
                                ),
                            padding: EdgeInsets.all(16),
                            addRepaintBoundaries: true,
                            children: List.generate(
                              10,
                              (index) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).width * .5 - 16,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          );
        }

        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
