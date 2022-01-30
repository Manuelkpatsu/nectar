import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nectar/screen/store/grcoery_tile/grocery_tile_model_data.dart';

import 'widget/banner_content_one.dart';
import 'widget/banner_content_two.dart';

@immutable
class HomeModelData extends Equatable {
  final List<Widget> bannerItems;
  final int currentBannerIndex;
  final List<GroceryTileModelData> bestSellingGroceries;
  final List<GroceryTileModelData> exclusiveGroceries;
  final List<GroceryTileModelData> groceries;

  const HomeModelData({
    this.bannerItems = const [
      BannerContentOne(),
      BannerContentTwo(),
    ],
    this.currentBannerIndex = 0,
    this.bestSellingGroceries = const [],
    this.exclusiveGroceries = const [],
    this.groceries = const [],
  });

  HomeModelData copyWith({
    List<Widget>? bannerItems,
    int? currentBannerIndex,
    List<GroceryTileModelData>? bestSellingGroceries,
    List<GroceryTileModelData>? exclusiveGroceries,
    List<GroceryTileModelData>? groceries,
  }) {
    return HomeModelData(
      bannerItems: bannerItems ?? this.bannerItems,
      currentBannerIndex: currentBannerIndex ?? this.currentBannerIndex,
      bestSellingGroceries: bestSellingGroceries ?? this.bestSellingGroceries,
      exclusiveGroceries: exclusiveGroceries ?? this.exclusiveGroceries,
      groceries: groceries ?? this.groceries,
    );
  }

  @override
  List<Object?> get props => [
        bannerItems,
        currentBannerIndex,
        bestSellingGroceries,
        exclusiveGroceries,
        groceries,
      ];
}
