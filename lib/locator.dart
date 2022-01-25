import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'repository/country_repository.dart';
import 'repository/user_repository.dart';
import 'screen/auth/auth_flow_coordinator.dart';
import 'screen/auth/phone/country/select_country_domain_model.dart';
import 'screen/auth/phone/country/select_country_notifier.dart';
import 'screen/auth/phone/country/select_country_tile_event_handler.dart';
import 'screen/auth/phone/number/enter_number_notifier.dart';
import 'screen/auth/phone/otp/enter_otp_notifier.dart';
import 'screen/store/account/account_notifier.dart';
import 'screen/store/app_entry/app_entry_notifier.dart';

final GetIt get = GetIt.instance;

void setUpLocator() {
  get.registerFactory(() => CountryRepository());
  get.registerFactory(() => UserRepository());
  get.registerFactoryParam<MyAuthFlowCoordinator, BuildContext, void>(
    (context, _) => MyAuthFlowCoordinator(context),
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
}
