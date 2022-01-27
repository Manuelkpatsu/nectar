import 'package:flutter/foundation.dart';

@immutable
class GrocerySearchArguments {
  final int? categoryId;
  final bool? isExclusive;
  final bool? isBestSelling;

  const GrocerySearchArguments(
    this.categoryId,
    this.isExclusive,
    this.isBestSelling,
  );
}
