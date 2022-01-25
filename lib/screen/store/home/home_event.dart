import 'package:flutter/material.dart';

abstract class HomeEvent {}

@immutable
class BannerChangedEvent extends HomeEvent {
  final int index;

  BannerChangedEvent(this.index);
}
