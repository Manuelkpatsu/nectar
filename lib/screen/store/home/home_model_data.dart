import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'widget/banner_content_one.dart';
import 'widget/banner_content_two.dart';

@immutable
class HomeModelData extends Equatable {
  final List<Widget> bannerItems;
  final int currentBannerIndex;

  const HomeModelData({
    this.bannerItems = const [
      BannerContentOne(),
      BannerContentTwo(),
    ],
    this.currentBannerIndex = 0,
  });

  HomeModelData copyWith({
    List<Widget>? bannerItems,
    int? currentBannerIndex,
  }) {
    return HomeModelData(
      bannerItems: bannerItems ?? this.bannerItems,
      currentBannerIndex: currentBannerIndex ?? this.currentBannerIndex,
    );
  }

  @override
  List<Object?> get props => [bannerItems, currentBannerIndex];
}
