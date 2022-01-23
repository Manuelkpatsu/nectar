import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'repository/country_repository.dart';
import 'screen/auth/auth_flow_coordinator.dart';
import 'screen/auth/phone/country/select_country_domain_model.dart';
import 'screen/auth/phone/country/select_country_notifier.dart';
import 'screen/auth/phone/country/select_country_tile_event_handler.dart';
import 'screen/auth/phone/number/enter_number_notifier.dart';

final GetIt get = GetIt.instance;

void setUpLocator() {
  get.registerFactory(() => CountryRepository());
  get.registerFactoryParam<MyAuthFlowCoordinator, BuildContext, void>(
    (context, _) => MyAuthFlowCoordinator(context),
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
      get<MyAuthFlowCoordinator>(param1: context),
    ),
  );
}
