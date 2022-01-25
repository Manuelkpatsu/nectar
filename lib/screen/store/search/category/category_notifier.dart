import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'category_domain_model.dart';
import 'category_model_data.dart';

class CategoryNotifier extends ValueNotifier<CategoryModelData> {
  final _logger = Logger();
  final CategoryDomainModel _categoryDomainModel;

  CategoryNotifier(this._categoryDomainModel)
      : super(const CategoryModelData());

  void init() {
    _categoryDomainModel.getCategoriesStream().listen((modelData) {
      value = modelData;
    }).onError((error) {
      _logger.e('Error loading categories', error);
    });
  }
}
