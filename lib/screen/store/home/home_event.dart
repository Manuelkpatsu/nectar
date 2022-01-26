import 'package:flutter/material.dart';

abstract class HomeEvent {}

@immutable
class BannerChangedEvent extends HomeEvent {
  final int index;

  BannerChangedEvent(this.index);
}

@immutable
class SeeExclusiveOfferEvent extends HomeEvent {
  final bool isExclusive;

  SeeExclusiveOfferEvent(this.isExclusive);
}

@immutable
class SeeBestSellingEvent extends HomeEvent {
  final bool isBestSelling;

  SeeBestSellingEvent(this.isBestSelling);
}

class SeeAllGroceriesEvent extends HomeEvent {}
