import 'package:flutter/material.dart';
import 'package:json_to_survey/src/store/store.dart';
import 'package:json_to_survey/src/widgets/app_state.dart';

import 'settings_controller.dart';

class SettingsPage extends Page {
  const SettingsPage({super.key, required this.controller});

  final SettingsController controller;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        return SettingsView(controller: controller);
      },
    );
  }
}

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<ThemeMode>(
              // Read the selected themeMode from the controller
              value: controller.themeMode,
              // Call the updateThemeMode method any time the user selects a theme.
              onChanged: controller.updateThemeMode,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Theme'),
                )
              ],
            ),
            Row(
              children: [
                StreamBuilder<Store?>(
                    stream: AppState.of(context).storeService.storeBehavior,
                    builder: (context, snapshot) {
                      return ElevatedButton(
                          child:
                              const Text("Verbindung zu PostgreSQL schließen"),
                          onPressed: () =>
                              AppState.of(context).storeService.store = null);
                    }),
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  child: ElevatedButton(
                      child: const Text("Sandbox"),
                      onPressed: () => appState.mainNavigatorService
                          .currentView = Views.sandboxView),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
