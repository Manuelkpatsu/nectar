import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../locator.dart';
import 'select_country_tile_event.dart';
import 'select_country_tile_event_handler.dart';
import 'select_country_tile_model_data.dart';
import 'widget/country_dial_code_text.dart';
import 'widget/country_flag_image.dart';
import 'widget/country_name_text.dart';

class SelectCountryTile extends StatelessWidget {
  late final SelectCountryTileEventHandler eventHandler;
  final eventController = StreamController<SelectCountryTileEvent>();
  final SelectCountryTileModelData modelData;

  SelectCountryTile(BuildContext context, this.modelData, {Key? key})
      : super(key: ValueKey(modelData.name)) {
    eventHandler = get<SelectCountryTileEventHandler>(param1: context);
    eventHandler.init(eventController);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(horizontal: -2, vertical: -1),
      leading:
          CountryFlagImage(image: modelData.code),
      title: CountryNameText(name: modelData.name),
      onTap: () {
        eventController.add(ChooseCountryEvent(modelData));
      },
      trailing: CountryDialCodeText(countryCode: modelData.dialCode),
    );
  }
}
