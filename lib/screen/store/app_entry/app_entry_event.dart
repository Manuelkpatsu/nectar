import 'package:flutter/material.dart';

abstract class AppEntryEvent {}

@immutable
class NavBarChangedEvent extends AppEntryEvent {
  final int index;

  NavBarChangedEvent(this.index);
}
