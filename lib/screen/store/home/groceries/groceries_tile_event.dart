import 'package:flutter/material.dart';

abstract class GroceriesTileEvent {}

@immutable
class GoToGroceryScreenEvent extends GroceriesTileEvent {
  final int id;

  GoToGroceryScreenEvent(this.id);
}
