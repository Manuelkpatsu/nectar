import 'dart:async';

import 'package:nectar/model/category.dart';
import 'package:nectar/repository/category_repository.dart';

import 'category_model_data.dart';
import 'category_tile_model_data.dart';

class CategoryDomainModel {
  final _categoriesController = StreamController<CategoryModelData>();
  final CategoryRepository _categoryRepository;

  CategoryDomainModel(this._categoryRepository);

  Stream<CategoryModelData> getCategoriesStream() {
    if (!_categoriesController.hasListener) {
      _refreshData();
    }
    return _categoriesController.stream.distinct();
  }

  void _refreshData() {
    _categoryRepository.getCategories().then((categories) {
      List<CategoryTileModelData> list = categories
          .map((category) => _categoryToTileModelData(category))
          .toList();

      _categoriesController.add(CategoryModelData(categories: list));
    });
  }

  CategoryTileModelData _categoryToTileModelData(Category category) {
    return CategoryTileModelData(
      id: category.id!,
      name: category.name!,
      image: category.image!,
    );
  }

  void dispose() {
    _categoriesController.close();
  }
}
