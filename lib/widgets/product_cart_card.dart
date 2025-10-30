import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCartCard extends StatelessWidget {
  const ProductCartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, top: 16),
        child: Row(
          children: [
            Center(child: Checkbox(value: true, onChanged: (value) {})),
            Image.network(
              'https://cdn.dummyjson.com/product-images/furniture/wooden-bathroom-sink-with-mirror/1.webp',
              width: MediaQuery.sizeOf(context).width * .2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width:
                        MediaQuery.sizeOf(context).width -
                        (MediaQuery.sizeOf(context).width * .4),
                    child: Text(
                      'Wooden Bathroom Sink With Mirror With Mirror',
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  Text(
                    'Bath Trends',
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '\$${799.99}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '\$799.99',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Theme.of(context).colorScheme.errorContainer,
                        ),
                        child: Text(
                          '5%',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset('icons/remove.svg'),
                      SizedBox(width: 10),
                      Text('1', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 10),
                      SvgPicture.asset('icons/add.svg'),
                      Expanded(child: SizedBox.shrink()),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'icons/trash.svg',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).disabledColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
