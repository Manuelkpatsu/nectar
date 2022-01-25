import 'package:flutter/material.dart';

abstract class CategoryTileEvent {}

@immutable
class GoToGrocerySearchScreenEvent extends CategoryTileEvent {
  final int id;

  GoToGrocerySearchScreenEvent(this.id);
}
