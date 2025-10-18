import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
  });

  final String imageUrl;
  final String title;
  final double price;
  final double rating;
  final int reviews;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .5 - 32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * .5 - 32,
            height: MediaQuery.sizeOf(context).width * .5 - 32,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).disabledColor),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(imageUrl),
          ),
          SizedBox(height: 10),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("\$ ", style: Theme.of(context).textTheme.titleLarge),
              Text(
                "$price",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.star, size: 18, color: Colors.amber),
              SizedBox(width: 3),
              Text('$rating'),
              SizedBox(width: 3),
              Text(
                '($reviews)',
                style: TextStyle(color: Theme.of(context).disabledColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
