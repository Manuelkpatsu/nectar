import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'home_event.dart';
import 'home_model_data.dart';

class HomeNotifier extends ValueNotifier<HomeModelData> {
  final _logger = Logger();
  late final StreamController<HomeEvent> _eventController;
  
  HomeNotifier() : super(const HomeModelData());

  void init(StreamController<HomeEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) {
      _logger.e('Error responding to home notifier event', error);
    });
  }

  /// Handles [HomeEvent]
  void _handleEvent(HomeEvent event) {
    if (event is BannerChangedEvent) {
      value = value.copyWith(currentBannerIndex: event.index);
    }
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}