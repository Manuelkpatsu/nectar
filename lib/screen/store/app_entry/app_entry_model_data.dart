import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nectar/screen/store/account/account_screen.dart';
import 'package:nectar/screen/store/cart/cart_screen.dart';
import 'package:nectar/screen/store/favorite/favorite_screen.dart';
import 'package:nectar/screen/store/home/home_screen.dart';
import 'package:nectar/screen/store/search/search_screen.dart';

@immutable
class AppEntryModelData extends Equatable {
  final int currentPageIndex;
  final List<Widget> screens;
  final List<BottomNavigationBarItem> navBarItems;

  const AppEntryModelData({
    this.currentPageIndex = 0,
    this.screens = const [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      FavoriteScreen(),
      AccountScreen(),
    ],
    this.navBarItems = const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Shop',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search_outlined),
        label: 'Explore',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_outlined),
        label: 'Favorite'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: 'Account',
      )
    ],
  });

  AppEntryModelData copyWith({
    int? currentPageIndex,
    List<Widget>? screens,
    List<BottomNavigationBarItem>? navBarItems,
  }) {
    return AppEntryModelData(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      screens: screens ?? this.screens,
      navBarItems: navBarItems ?? this.navBarItems,
    );
  }

  @override
  List<Object?> get props => [
        currentPageIndex,
        screens,
        navBarItems,
      ];
}
