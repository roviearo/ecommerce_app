import 'package:ecommerce_app/utils/router.dart';
import 'package:ecommerce_app/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
          height: 35,
          child: TextField(
            onTap: () => router.pushNamed('search'),
            style: TextStyle(fontSize: 14),
            readOnly: true,
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
