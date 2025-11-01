// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:ecommerce_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/utils/nav_model.dart';
import 'package:ecommerce_app/widgets/nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.index});

  final String? index;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final chatNavKey = GlobalKey<NavigatorState>();
  final cartNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  late int _selectedIndex;
  List<NavModel> items = [];

  @override
  void initState() {
    super.initState();
    log('mainscreen called ${widget.index}');
    _selectedIndex = widget.index != '' ? 2 : 0;
    items = [
      NavModel(page: const HomeScreen(), navKey: homeNavKey),
      NavModel(page: const Placeholder(), navKey: chatNavKey),
      NavModel(page: const CartScreen(), navKey: cartNavKey),
      NavModel(page: const ProfileScreen(), navKey: profileNavKey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: items
            .map(
              (page) => Navigator(
                key: page.navKey,
                onGenerateInitialRoutes: (navigator, initialRoute) {
                  return [MaterialPageRoute(builder: (context) => page.page)];
                },
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: NavBar(
        pageIndex: _selectedIndex,
        onTap: (index) {
          if (index == _selectedIndex) {
            items[index].navKey.currentState?.popUntil(
              (route) => route.isFirst,
            );
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}
