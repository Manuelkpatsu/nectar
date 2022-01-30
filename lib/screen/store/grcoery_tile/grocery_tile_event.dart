import 'package:flutter/material.dart';

abstract class GroceryTileEvent {}

@immutable
class GoToGroceryScreenEvent extends GroceryTileEvent {
  final int id;

  GoToGroceryScreenEvent(this.id);
}

@immutable
class ToggleFavoriteEvent extends GroceryTileEvent {
  final bool isFavorite;

  ToggleFavoriteEvent(this.isFavorite);
}
