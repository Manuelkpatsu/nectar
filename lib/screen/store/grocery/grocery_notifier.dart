import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'grocery_domain_model.dart';
import 'grocery_event.dart';
import 'grocery_model_data.dart';

class GroceryNotifier extends ValueNotifier<GroceryModelData> {
  final _logger = Logger();
  final GroceryDomainModel _groceryDomainModel;
  final int _groceryId;
  late final StreamController<GroceryEvent> _eventController;

  GroceryNotifier(this._groceryDomainModel, this._groceryId)
      : super(const GroceryModelData());

  void init(StreamController<GroceryEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) {
      _logger.e('Error responding to grocery notifier event', error);
    });

    _groceryDomainModel.getGroceryStream(_groceryId).listen((modelData) {
      _refreshUI(modelData);
    }).onError((error) {
      _logger.e('Error loading categories', error);
    });
  }

  /// Handles [GroceryEvent]
  void _handleEvent(GroceryEvent event) {
    if (event is AddToBasketEvent) {
    } else if (event is ToggleFavoriteEvent) {
    } else if (event is GoToReviewEvent) {
    } else if (event is QuantityIncrementEvent) {
      _increaseQuantity();
    } else if (event is QuantityDecreamentEvent) {
      _decreaseQuantity();
    } else if (event is ShareGroceryEvent) {
    } else if (event is ImageChangedEvent) {
      value = value.copyWith(currentImageIndex: event.index);
    }
  }

  /// Updates the UI
  ///
  /// [modelData] new data to update to
  void _refreshUI(GroceryModelData? modelData) {
    if (modelData != null) {
      value = value.copyWith(grocery: modelData.grocery);
    } else {
      _logger.w('Grocery does not exist');
    }
  }

  void _increaseQuantity() {
    int newQuantity = value.selectedQuantity + 1;
    value = value.copyWith(
      selectedQuantity: newQuantity,
    );
  }

  void _decreaseQuantity() {
    int newQuantity = value.selectedQuantity - 1;
    value = value.copyWith(
      selectedQuantity: newQuantity,
    );
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}
