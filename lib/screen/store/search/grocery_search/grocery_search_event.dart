import 'package:flutter/material.dart';

abstract class GrocerySearchEvent {}

@immutable
class SearchGroceryEvent extends GrocerySearchEvent {
  final String searchQuery;

  SearchGroceryEvent(this.searchQuery);
}

class ClearSearchQueryEvent extends GrocerySearchEvent {}
