import 'package:ecommerce_app/cubit/detail_product/detail_product_cubit.dart';
import 'package:ecommerce_app/cubit/search_product/search_product_cubit.dart';
import 'package:ecommerce_app/utils/router.dart';
import 'package:ecommerce_app/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearchEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SizedBox(
            height: 35,
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                if (value.isEmpty || searchController.text.isEmpty) {
                  context.read<SearchProductCubit>().clearSearch();
                  setState(() {
                    isSearchEmpty = true;
                  });
                } else {
                  setState(() {
                    isSearchEmpty = false;
                  });
                  context.read<SearchProductCubit>().searchProduct(value);
                }
              },
              style: TextStyle(fontSize: 14),
              autofocus: true,
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
                suffixIcon: isSearchEmpty
                    ? SizedBox.shrink()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            context.read<SearchProductCubit>().clearSearch();
                            searchController.clear();
                            isSearchEmpty = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset(
                            'icons/clear.svg',
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.outline,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                prefixIconConstraints: BoxConstraints(maxWidth: 30),
                suffixIconConstraints: BoxConstraints(maxWidth: 30),
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
      body: BlocBuilder<SearchProductCubit, SearchProductState>(
        builder: (context, state) {
          final listProduct = state.listProduct;

          if (listProduct.isEmpty) {
            if (state.status == SearchProductStatus.initial) {
              return Center(child: Text('Start search product'));
            }
            return Center(child: Text('No product found'));
          }
          return ListView.builder(
            itemCount: listProduct.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  context.read<DetailProductCubit>().loadDetailProduct(
                    listProduct[index].id,
                  );
                  router.pushNamed('detail_product');
                },
                leading: Image.network(listProduct[index].thumbnail),
                title: Text(listProduct[index].title),
              );
            },
          );
        },
      ),
    );
  }
}
