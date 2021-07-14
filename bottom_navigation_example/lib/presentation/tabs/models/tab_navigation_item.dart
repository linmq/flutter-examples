import 'package:bottom_navigation_example/presentation/home/pages/home_page.dart';
import 'package:bottom_navigation_example/presentation/search/pages/search_page.dart';
import 'package:bottom_navigation_example/presentation/shop/pages/shop_page.dart';
import 'package:flutter/material.dart';

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomePage(),
          icon: Icon(Icons.home),
          title: "Home",
        ),
        TabNavigationItem(
          page: ShopPage(),
          icon: Icon(Icons.shopping_basket),
          title: "Shop",
        ),
        TabNavigationItem(
          page: SearchPage(),
          icon: Icon(Icons.search),
          title: "Search",
        ),
      ];
}
