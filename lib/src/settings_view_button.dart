
import 'package:flutter/material.dart';

import 'widgets/app_state.dart';

class SettingsViewButton extends StatelessWidget {
  const SettingsViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);

    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        appState.mainNavigatorService.currentView = Views.settingsView;
      },
    );
  }
}
