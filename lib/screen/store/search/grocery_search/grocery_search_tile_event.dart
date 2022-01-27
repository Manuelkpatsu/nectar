import 'package:flutter/material.dart';

abstract class GrocerySearchTileEvent {}

@immutable
class GoToGroceryScreenEvent extends GrocerySearchTileEvent {
  final int id;

  GoToGroceryScreenEvent(this.id);
}
