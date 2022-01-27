import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nectar/model/grocery.dart';

@immutable
class GrocerySearchTileModelData extends Equatable {
  final Grocery grocery;

  const GrocerySearchTileModelData({
    required this.grocery
  });

  @override
  List<Object?> get props => [grocery];
}
