import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar/screen/store/widget/grocery_item.dart';

import '../../../../locator.dart';
import 'grocery_search_tile_event.dart';
import 'grocery_search_tile_event_handler.dart';
import 'grocery_search_tile_model_data.dart';

class GrocerySearchTile extends StatelessWidget {
  late final GrocerySearchTileEventHandler eventHandler;
  final eventController = StreamController<GrocerySearchTileEvent>();
  final GrocerySearchTileModelData modelData;

  GrocerySearchTile(BuildContext context, this.modelData, {Key? key})
      : super(key: ValueKey(modelData.grocery.id)) {
    eventHandler = get<GrocerySearchTileEventHandler>(param1: context);
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
