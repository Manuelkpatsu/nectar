import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nectar/screen/store/store_flow_coordinator.dart';

import 'home_domain_model.dart';
import 'home_event.dart';
import 'home_model_data.dart';

class HomeNotifier extends ValueNotifier<HomeModelData> {
  final _logger = Logger();
  final HomeDomainModel _homeDomainModel;
  final StoreFlowCoordinator _storeFlowCoordinator;
  late final StreamController<HomeEvent> _eventController;
  
  HomeNotifier(this._homeDomainModel, this._storeFlowCoordinator,) : super(const HomeModelData());

  void init(StreamController<HomeEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) {
      _logger.e('Error responding to home notifier event', error);
    });

    _homeDomainModel.getGroceriesStream().listen((modelData) {
      value = modelData;
    }).onError((error) {
      _logger.e('Error loading categories', error);
    });
  }

  /// Handles [HomeEvent]
  void _handleEvent(HomeEvent event) {
    if (event is BannerChangedEvent) {
      value = value.copyWith(currentBannerIndex: event.index);
    } else if (event is SeeAllGroceriesEvent) {
      _storeFlowCoordinator.goToViewAllGrocerySearchScreen();
    } else if (event is SeeBestSellingEvent) {
      _storeFlowCoordinator.goToGrocerySearchScreen(null, null, event.isBestSelling);
    } else if (event is SeeExclusiveOfferEvent) {
      _storeFlowCoordinator.goToGrocerySearchScreen(null, event.isExclusive, null);
    }
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}