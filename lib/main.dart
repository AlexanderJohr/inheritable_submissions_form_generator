import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/store/store.dart';
import 'package:json_to_survey/src/view_model/view_models.dart';
import 'package:json_to_survey/src/widgets/app_state.dart';
import 'package:json_to_survey/submissions_detail_table.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  GetIt.I.registerSingleton<ViewModel>(ViewModel());
  GetIt.I.registerSingleton<CellSizesService>(CellSizesService());
  GetIt.I.registerSingleton<ChoiceFilterService>(ChoiceFilterService());

  final StoreService storeService = StoreService();
  final SidebarNavigatorService sidebarNavigatorService =
      SidebarNavigatorService();
  final MainNavigatorService mainNavigatorService = MainNavigatorService();

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(
      settingsController: settingsController,
      storeService: storeService,
      sidebarNavigatorService: sidebarNavigatorService,
      mainNavigatorService: mainNavigatorService));
}
