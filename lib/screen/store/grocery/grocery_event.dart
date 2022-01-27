import 'package:flutter/material.dart';

abstract class GroceryEvent {}

class AddToBasketEvent extends GroceryEvent {}

class ToggleFavoriteEvent extends GroceryEvent {}

class GoToReviewEvent extends GroceryEvent {}

class QuantityIncrementEvent extends GroceryEvent {}

class QuantityDecreamentEvent extends GroceryEvent {}

class ShareGroceryEvent extends GroceryEvent {}

@immutable
class ImageChangedEvent extends GroceryEvent {
  final int index;

  ImageChangedEvent(this.index);
}
