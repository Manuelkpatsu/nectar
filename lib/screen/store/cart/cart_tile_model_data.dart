import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class CartTileModelData extends Equatable {
  final int id;
  final String name;
  final String image;
  final int selectedQuantity;
  final double totalAmount;
  final double price;
  final String perPrice;

  const CartTileModelData({
    required this.id,
    required this.name,
    required this.image,
    required this.selectedQuantity,
    required this.totalAmount,
    required this.price,
    required this.perPrice,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        selectedQuantity,
        totalAmount,
        price,
        perPrice,
      ];
}
