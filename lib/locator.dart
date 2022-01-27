import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'repository/category_repository.dart';
import 'repository/country_repository.dart';
import 'repository/grocery_repository.dart';
import 'repository/user_repository.dart';
import 'screen/auth/auth_flow_coordinator.dart';
import 'screen/auth/phone/country/select_country_domain_model.dart';
import 'screen/auth/phone/country/select_country_notifier.dart';
import 'screen/auth/phone/country/select_country_tile_event_handler.dart';
import 'screen/auth/phone/number/enter_number_notifier.dart';
import 'screen/auth/phone/otp/enter_otp_notifier.dart';
import 'screen/store/account/account_notifier.dart';
import 'screen/store/app_entry/app_entry_notifier.dart';
import 'screen/store/grocery/grocery_domain_model.dart';
import 'screen/store/grocery/grocery_notifier.dart';
import 'screen/store/home/best_selling/best_selling_tile_event_handler.dart';
import 'screen/store/home/exclusive/exclusive_tile_event_handler.dart';
import 'screen/store/home/groceries/groceries_tile_event_handler.dart';
import 'screen/store/home/home_domain_model.dart';
import 'screen/store/home/home_notifier.dart';
import 'screen/store/search/category/category_domain_model.dart';
import 'screen/store/search/category/category_notifier.dart';
import 'screen/store/search/category/category_tile_event_handler.dart';
import 'screen/store/store_flow_coordinator.dart';

final GetIt get = GetIt.instance;

void setUpLocator() {
  get.registerFactory(() => CountryRepository());
  get.registerFactory(() => UserRepository());
  get.registerFactory(() => CategoryRepository());
  get.registerFactory(() => GroceryRepository());
  get.registerFactoryParam<MyAuthFlowCoordinator, BuildContext, void>(
    (context, _) => MyAuthFlowCoordinator(context),
  );
  get.registerFactoryParam<MyStoreFlowCoordinator, BuildContext, void>(
    (context, _) => MyStoreFlowCoordinator(context),
  );

  /// AppEntryScreen
  get.registerFactoryParam<AppEntryNotifier, BuildContext, void>(
    (context, _) => AppEntryNotifier(),
  );

  /// SelectCountryScreen
  get.registerFactory(() => SelectCountryDomainModel(get<CountryRepository>()));
  get.registerFactoryParam<SelectCountryNotifier, BuildContext, void>(
    (context, _) => SelectCountryNotifier(get<SelectCountryDomainModel>()),
  );
  get.registerFactoryParam<SelectCountryTileEventHandler, BuildContext, void>(
    (context, _) => SelectCountryTileEventHandler(
      get<MyAuthFlowCoordinator>(param1: context),
    ),
  );

  /// EnterNumberScreen
  get.registerFactoryParam<EnterNumberNotifier, BuildContext, void>(
    (context, _) => EnterNumberNotifier(
      context,
      get<MyAuthFlowCoordinator>(param1: context),
    ),
  );

  /// EnterOTPScreen
  get.registerFactoryParam<EnterOTPNotifier, BuildContext, void>(
    (context, _) => EnterOTPNotifier(
      context,
      get<MyAuthFlowCoordinator>(param1: context),
    ),
  );

  /// AccountScreen
  get.registerFactoryParam<AccountNotifier, BuildContext, void>(
    (context, _) => AccountNotifier(get<UserRepository>()),
  );

  /// CategoryScreen
  get.registerFactory(() => CategoryDomainModel(get<CategoryRepository>()));
  get.registerFactoryParam<CategoryNotifier, BuildContext, void>(
    (context, _) => CategoryNotifier(get<CategoryDomainModel>()),
  );
  get.registerFactoryParam<CategoryTileEventHandler, BuildContext, void>(
    (context, _) => CategoryTileEventHandler(
      get<MyStoreFlowCoordinator>(param1: context),
    ),
  );

  /// HomeScreen
  get.registerFactory(() => HomeDomainModel(get<GroceryRepository>()));
  get.registerFactoryParam<HomeNotifier, BuildContext, void>(
    (context, _) => HomeNotifier(
      get<HomeDomainModel>(),
      get<MyStoreFlowCoordinator>(param1: context),
    ),
  );
  get.registerFactoryParam<BestSellingTileEventHandler, BuildContext, void>(
    (context, _) => BestSellingTileEventHandler(
      get<MyStoreFlowCoordinator>(param1: context),
    ),
  );
  get.registerFactoryParam<ExclusiveTileEventHandler, BuildContext, void>(
    (context, _) => ExclusiveTileEventHandler(
      get<MyStoreFlowCoordinator>(param1: context),
    ),
  );
  get.registerFactoryParam<GroceriesTileEventHandler, BuildContext, void>(
    (context, _) => GroceriesTileEventHandler(
      get<MyStoreFlowCoordinator>(param1: context),
    ),
  );

  /// GroceryScreen
  get.registerFactory(() => GroceryDomainModel(get<GroceryRepository>()));
  get.registerFactoryParam<GroceryNotifier, BuildContext, int>(
    (context, groceryId) => GroceryNotifier(
      get<GroceryDomainModel>(),
      groceryId,
    ),
  );
}
