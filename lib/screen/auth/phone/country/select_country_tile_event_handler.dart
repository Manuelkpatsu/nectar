import 'dart:async';

import 'package:logger/logger.dart';
import 'package:nectar/model/country.dart';

import '../../auth_flow_coordinator.dart';
import 'select_country_tile_model_data.dart';
import 'select_country_tile_event.dart';

class SelectCountryTileEventHandler {
  final _logger = Logger();
  final AuthFlowCoordinator _authFlowCoordinator;
  late final StreamController<SelectCountryTileEvent> _eventController;

  SelectCountryTileEventHandler(this._authFlowCoordinator);

  void init(StreamController<SelectCountryTileEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) => _logger.e("Error responding to event", error));
  }

  /// Handles [SelectCountryTileEvent]
  _handleEvent(SelectCountryTileEvent event) {
    switch (event.runtimeType) {
      case ChooseCountryEvent:
        final chooseCountryEvent = event as ChooseCountryEvent;
        _selectCountry(chooseCountryEvent.modelData);
        break;
    }
  }

  void _selectCountry(SelectCountryTileModelData modelData) {
    Country selectedCountry = Country(
      name: modelData.name,
      code: modelData.code,
      dialCode: modelData.dialCode,
    );
    _authFlowCoordinator.closeSelectCountryScreen(selectedCountry);
  }

  void dispose() {
    _eventController.close();
  }
}
