import 'dart:async';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar/model/grocery.dart';
import 'package:nectar/screen/store/grocery/widget/choose_quantity.dart';
import 'package:nectar/screen/store/grocery/widget/price_text.dart';
import 'package:nectar/screen/store/grocery/widget/thumbnail_carousel.dart';
import 'package:nectar/screen/widget/app_divider.dart';

import '../../../locator.dart';
import 'grocery_argument.dart';
import 'grocery_event.dart';
import 'grocery_notifier.dart';
import 'grocery_listenable.dart';
import 'widget/add_to_basket_button.dart';
import 'widget/favorite_button.dart';
import 'widget/grocery_description.dart';
import 'widget/grocery_name_text.dart';
import 'widget/nutrients.dart';
import 'widget/per_price_text.dart';
import 'widget/review.dart';

class GroceryScreen extends StatefulWidget {
  final GroceryArgument argument;

  const GroceryScreen(this.argument, {Key? key}) : super(key: key);

  @override
  _GroceryScreenState createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  final eventController = StreamController<GroceryEvent>();
  late final GroceryNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = get<GroceryNotifier>(
        param1: context, param2: widget.argument.groceryId);
    notifier.init(eventController);
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<Grocery?>(
          valueListenable: notifier.grocery,
          builder: (context, grocery, child) {
            if (grocery != null) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 250,
                    floating: false,
                    pinned: true,
                    snap: false,
                    elevation: 0.3,
                    actions: [
                      IconButton(
                        onPressed: () => eventController.add(ShareGroceryEvent()),
                        icon: const Icon(CupertinoIcons.share),
                        splashRadius: 20,
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: ThumbnailCarousel(
                        images: grocery.photos!,
                        onPageChanged:
                            (int index, CarouselPageChangedReason reason) {
                          eventController.add(ImageChangedEvent(index));
                        },
                        imageIndexListenable: notifier.imageIndex,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GroceryNameText(name: grocery.name!),
                            const SizedBox(width: 10),
                            FavoriteButton(onPressed: () {}),
                          ],
                        ),
                      ),
                      PerPriceText(perPrice: grocery.perPrice!),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ChooseQuantity(
                              decrement: () {
                                eventController.add(QuantityDecreamentEvent());
                              }, 
                              increment: () {
                                eventController.add(QuantityIncrementEvent());
                              }, 
                              quantityListenable: notifier.quantity, 
                              groceryQuantity: grocery.quantity!,
                            ),
                            const SizedBox(width: 10),
                            PriceText(price: grocery.price!),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GroceryDescription(description: grocery.description!),
                      Nutrients(nutrient: grocery.nutrients!, onTap: () {},),
                      const AppDivider(padding: EdgeInsets.symmetric(horizontal: 16)),
                      Review(rating: grocery.rating!, onTap: () {},),
                      const SizedBox(height: 10),
                      AddToBasketButton(onPressed: () {}),
                      const SizedBox(height: 150),
                    ]),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
