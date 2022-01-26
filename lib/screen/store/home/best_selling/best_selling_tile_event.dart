import 'package:flutter/material.dart';

abstract class BestSellingTileEvent {}

@immutable
class GoToGroceryScreenEvent extends BestSellingTileEvent {
  final int id;

  GoToGroceryScreenEvent(this.id);
}
