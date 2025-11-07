// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/utils/router.dart';
import 'package:flutter/material.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(16),
                width: 50,
                height: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Center(
              child: Text(
                'Added to cart',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Center(child: Image.network(product.thumbnail)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                product.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: FilledButton(
                onPressed: () => router.pushReplacementNamed(
                  'main',
                  queryParameters: {'index': '2'},
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('See Cart')],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
