import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar/screen/store/widget/grocery_item.dart';

import '../../../../locator.dart';
import 'groceries_tile_event.dart';
import 'groceries_tile_event_handler.dart';
import 'groceries_tile_model_data.dart';

class GroceriesTile extends StatelessWidget {
  late final GroceriesTileEventHandler eventHandler;
  final eventController = StreamController<GroceriesTileEvent>();
  final GroceriesTileModelData modelData;

  GroceriesTile(BuildContext context, this.modelData, {Key? key})
      : super(key: ValueKey(modelData.grocery.id)) {
    eventHandler = get<GroceriesTileEventHandler>(param1: context);
    eventHandler.init(eventController);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GroceryItem(
        onTap: () {
          eventController.add(GoToGroceryScreenEvent(modelData.grocery.id!));
        },
        addToCart: () {},
        image: modelData.grocery.photos![0],
        name: modelData.grocery.name!,
        perPrice: modelData.grocery.perPrice!,
        price: modelData.grocery.price!,
      ),
    );
  }
}
