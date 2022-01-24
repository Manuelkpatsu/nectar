import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'app_entry_event.dart';
import 'app_entry_model_data.dart';

class AppEntryNotifier extends ValueNotifier<AppEntryModelData> {
  final _logger = Logger();
  late final StreamController<AppEntryEvent> _eventController;
  
  AppEntryNotifier() : super(const AppEntryModelData());

  void init(StreamController<AppEntryEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) {
      _logger.e('Error responding to app entry notifier event', error);
    });
  }

  /// Handles [AppEntryEvent]
  void _handleEvent(AppEntryEvent event) {
    if (event is NavBarChangedEvent) {
      value = value.copyWith(currentPageIndex: event.index);
    }
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}
