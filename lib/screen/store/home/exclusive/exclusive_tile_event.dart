import 'package:flutter/material.dart';

abstract class ExclusiveTileEvent {}

@immutable
class GoToGroceryScreenEvent extends ExclusiveTileEvent {
  final int id;

  GoToGroceryScreenEvent(this.id);
}
