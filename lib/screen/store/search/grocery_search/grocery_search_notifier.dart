import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:logger/logger.dart';

import 'grocery_search_arguments.dart';
import 'grocery_search_domain_model.dart';
import 'grocery_search_event.dart';
import 'grocery_search_tile_model_data.dart';

class GrocerySearchNotifier
    extends ValueNotifier<List<GrocerySearchTileModelData>> {
  final _logger = Logger();
  final GrocerySearchDomainModel _grocerySearchDomainModel;
  final GrocerySearchArguments? _argumnets;
  List<GrocerySearchTileModelData> _groceries = [];
  late final StreamController<GrocerySearchEvent> _eventController;

  GrocerySearchNotifier(this._grocerySearchDomainModel, this._argumnets) : super([]);

  void init(StreamController<GrocerySearchEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) => _logger.e('Error responding to event', error));

    _grocerySearchDomainModel
        .getGrocerySearchTileModelDataListStream(_argumnets)
        .listen((groceries) {
      _groceries = groceries;
      value = groceries;
    });
  }

  /// Handles [GrocerySearchEvent]
  _handleEvent(GrocerySearchEvent event) {
    switch (event.runtimeType) {
      case SearchGroceryEvent:
        final searchCountryEvent = event as SearchGroceryEvent;
        _search(searchCountryEvent.searchQuery);
        break;
      case ClearSearchQueryEvent:
        _clearSearchQuery();
        break;
    }
  }

  /// Searches the grocery list and returns
  /// groceries that match the [searchQuery]
  void _search(String searchQuery) {
    final fuse = Fuzzy<GrocerySearchTileModelData>(
      _groceries,
      options: FuzzyOptions(
        threshold: 0.2,
        keys: [
          WeightedKey(
            getter: (i) => i.grocery.name!,
            weight: 1,
            name: 'name',
          ),
        ],
      ),
    );

    final result = fuse.search(searchQuery);
    final filteredGroceryList = result.map((r) => r.item).toList();
    value = filteredGroceryList;
  }

  /// Resets the grocery list
  void _clearSearchQuery() {
    value = _groceries;
  }

  @override
  void dispose() {
    _grocerySearchDomainModel.dispose();
    _eventController.close();
    super.dispose();
  }
}
