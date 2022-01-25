import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../locator.dart';
import 'category_tile_event.dart';
import 'category_tile_event_handler.dart';
import 'category_tile_model_data.dart';
import 'widget/category_image.dart';
import 'widget/category_name.dart';

class CategoryTile extends StatelessWidget {
  final Color color;
  late final CategoryTileEventHandler eventHandler;
  final eventController = StreamController<CategoryTileEvent>();
  final CategoryTileModelData modelData;

  CategoryTile(BuildContext context, this.modelData, this.color, {Key? key})
      : super(key: ValueKey(modelData.id)) {
    eventHandler = get<CategoryTileEventHandler>(param1: context);
    eventHandler.init(eventController);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: () {
          eventController.add(GoToGrocerySearchScreenEvent(modelData.id));
        },
        child: Ink(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CategoryImage(image: modelData.image),
              const SizedBox(height: 30),
              CategoryName(name: modelData.name),
            ],
          ),
        ),
      ),
    );
  }
}
