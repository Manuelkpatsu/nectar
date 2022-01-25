import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'category_tile_model_data.dart';

@immutable
class CategoryModelData extends Equatable {
  final List<CategoryTileModelData> categories;

  const CategoryModelData({this.categories = const []});

  @override
  List<Object?> get props => [categories];
}
