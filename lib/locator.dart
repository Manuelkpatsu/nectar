import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nectar/screen/store/cart/cart_notifier.dart';
import 'package:nectar/screen/store/grcoery_tile/grocery_tile_event_handler.dart';
import 'package:nectar/screen/store/search/grocery_search/grocery_search_arguments.dart';

import 'repository/category_repository.dart';
import 'repository/country_repository.dart';
import 'repository/grocery_repository.dart';
import 'repository/user_repository.dart';
import 'screen/auth/auth_flow_coordinator.dart';
import 'screen/auth/onboarding/welcome_notifier.dart';
import 'screen/auth/phone/country/select_country_domain_model.dart';
import 'screen/auth/phone/country/select_country_notifier.dart';
import 'screen/auth/phone/country/select_country_tile_event_handler.dart';
import 'screen/auth/phone/number/enter_number_notifier.dart';
import 'screen/auth/phone/otp/enter_otp_notifier.dart';
import 'screen/auth/sign_in/sign_in_notifier.dart';
import 'screen/auth/sign_in_info/sign_in_info_notifier.dart';
import 'screen/auth/sign_up/sign_up_notifier.dart';
import 'screen/auth/splash/splash_notifier.dart';
import 'screen/store/account/account_notifier.dart';
import 'screen/store/app_entry/app_entry_notifier.dart';
import 'screen/store/grocery/grocery_domain_model.dart';
import 'screen/store/grocery/grocery_notifier.dart';
import 'screen/store/home/home_domain_model.dart';
import 'screen/store/home/home_notifier.dart';
import 'screen/store/search/category/category_domain_model.dart';
import 'screen/store/search/category/category_notifier.dart';
import 'screen/store/search/category/category_tile_event_handler.dart';
import 'screen/store/search/grocery_search/grocery_search_domain_model.dart';
import 'screen/store/search/grocery_search/grocery_search_notifier.dart';
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

  // SplashScreen
  get.registerFactoryParam<SplashNotifier, BuildContext, void>(
    (context, _) => SplashNotifier(
      get<MyAuthFlowCoordinator>(param1: context),
    ),
  );

  // WelcomeScreen
  get.registerFactoryParam<WelcomeNotifier, BuildContext, void>(
    (context, _) => WelcomeNotifier(
      get<MyAuthFlowCoordinator>(param1: context),
    ),
  );

  // SignInInfoScreen
  get.registerFactoryParam<SignInInfoNotifier, BuildContext, void>(
    (context, _) => SignInInfoNotifier(
      get<MyAuthFlowCoordinator>(param1: context),
    ),
  );

  // SignInScreen
  get.registerFactoryParam<SignInNotifier, BuildContext, void>(
    (context, _) => SignInNotifier(
      context,
      get<MyAuthFlowCoordinator>(param1: context),
    ),
  );

  // SignUpScreen
  get.registerFactoryParam<SignUpNotifier, BuildContext, void>(
    (context, _) => SignUpNotifier(
      context,
      get<MyAuthFlowCoordinator>(param1: context),
    ),
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
    (context, _) => AccountNotifier(
      get<UserRepository>(),
      get<MyStoreFlowCoordinator>(param1: context),
    ),
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

  /// GroceryTile
  get.registerFactoryParam<GroceryTileEventHandler, BuildContext, void>(
    (context, _) => GroceryTileEventHandler(
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

  /// GroceryScreen
  get.registerFactory(() => GroceryDomainModel(get<GroceryRepository>()));
  get.registerFactoryParam<GroceryNotifier, BuildContext, int>(
    (context, groceryId) => GroceryNotifier(
      get<GroceryDomainModel>(),
      groceryId,
    ),
  );

  /// GrocerySearchScreen
  get.registerFactory(() => GrocerySearchDomainModel(get<GroceryRepository>()));
  get.registerFactoryParam<GrocerySearchNotifier, BuildContext,
      GrocerySearchArguments?>(
    (context, arguments) => GrocerySearchNotifier(
      get<GrocerySearchDomainModel>(),
      arguments,
    ),
  );

  /// CartScreen
  get.registerFactoryParam<CartNotifier, BuildContext, void>(
    (context, _) => CartNotifier(
      get<MyStoreFlowCoordinator>(param1: context),
    ),
  );
}
