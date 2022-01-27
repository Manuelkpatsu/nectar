import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nectar/model/grocery.dart';

@immutable
class GroceryModelData extends Equatable {
  final int currentImageIndex;
  final Grocery? grocery;
  final int selectedQuantity;

  const GroceryModelData({
    this.grocery,
    this.currentImageIndex = 0,
    this.selectedQuantity = 1,
  });

  GroceryModelData copyWith({
    Grocery? grocery,
    int? currentImageIndex,
    int? selectedQuantity,
  }) {
    return GroceryModelData(
      grocery: grocery ?? this.grocery,
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
      selectedQuantity: selectedQuantity ?? this.selectedQuantity,
    );
  }

  @override
  List<Object?> get props => [
        grocery,
        currentImageIndex,
        selectedQuantity,
      ];
}
