import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.imageUrl, required this.title});

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Card(
        child: Container(
          width: 85,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: Center(
            child: Column(
              children: [
                Center(child: Image.asset(imageUrl, width: 50, height: 50)),
                Spacer(),
                Text(title, style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
