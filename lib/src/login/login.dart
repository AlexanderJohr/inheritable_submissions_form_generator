import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/dialogs/exception_dialog.dart';
import 'package:json_to_survey/src/settings_view_button.dart';
import 'package:json_to_survey/src/store/postgre_sql_store.dart';
import 'package:json_to_survey/src/store/store.dart';

import '../widgets/app_state.dart';

class LoginPage extends Page {
  const LoginPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        return const LoginView();
      },
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController hostController = TextEditingController(text: "127.0.0.1");

  TextEditingController databaseNameController = TextEditingController(text: "massnahmen");

  TextEditingController userNameController = TextEditingController(text: "postgres");

  TextEditingController passwordController = TextEditingController(text: "root");

  @override
  Widget build(BuildContext context) {
    final storeService = AppState.of(context).storeService;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: const Text("Login"),
            )
          ],
        ),
        actions: const [
          SettingsViewButton(),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Row(
                      children: [
                        ElevatedButton(
                          child: Text(AppLocalizations.of(context)!.loginViaInstituteText),
                          onPressed: loginToHostDirectlyOnPressed,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: ElevatedButton(
                            child: Text(AppLocalizations.of(context)!.loginViaSSHTunnel),
                            onPressed: loginViaSshOnPressed,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: TextField(
                    controller: hostController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.databaseHostLabel,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: databaseNameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.databaseNameLabel,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.userNameLabel,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.passwordLabel,
                    ),
                  ),
                ),
                SizedBox(
                    height: 50,
                    width: 200.0,
                    child: ElevatedButton(
                      child: Text(AppLocalizations.of(context)!.sendButtonText),
                      onPressed: () async {
                        try {
                          await login(storeService);
                        } catch (e) {
                          if (context.mounted) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ExceptionDialog(
                                    exception: e.toString(),
                                  );
                                });
                          }
                        }
                      },
                    ))
              ]),
            ],
          )),
    );
  }

  Future<void> login(StoreService storeService) async {
    final store = PostgreSQLStore(
        host: hostController.text,
        port: 5432,
        databaseName: databaseNameController.text,
        username: userNameController.text,
        password: passwordController.text,
        onSocketDone: () {
          storeService.storeBehavior.value = null;
        });

    final storeIsRegistered = GetIt.I.isRegistered<Store>();
    if (storeIsRegistered) {
      GetIt.I.unregister<Store>();
    }
    GetIt.I.registerSingleton<Store>(store);

    await store.connect();

    storeService.storeBehavior.value = store;
    await store.fetchSurveys();
  }

  void loginViaSshOnPressed() {
    hostController.text = "127.0.0.1";
  }

  void loginToHostDirectlyOnPressed() {
    hostController.text = "";
  }
}
