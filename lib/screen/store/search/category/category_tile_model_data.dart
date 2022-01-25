import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class CategoryTileModelData extends Equatable {
  final int id;
  final String name;
  final String image;

  const CategoryTileModelData({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}
