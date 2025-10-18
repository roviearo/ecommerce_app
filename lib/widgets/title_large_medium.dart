import 'package:flutter/material.dart';

class TitleLargeMedium extends StatelessWidget {
  const TitleLargeMedium({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          TextButton(onPressed: () {}, child: Text('See All')),
        ],
      ),
    );
  }
}
