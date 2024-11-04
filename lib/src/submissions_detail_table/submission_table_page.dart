import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/dialogs/exception_dialog.dart';
import 'package:json_to_survey/src/settings_view_button.dart';
import 'package:json_to_survey/src/submissions_detail_table/submissions_table.dart';
import 'package:rxdart/rxdart.dart';

import '../store/store.dart';
import '../view_model/view_models.dart';
import '../submission_overview/submission_overview_view.dart';
import '../widgets/app_state.dart';

class SubmissionTablePage extends Page {
  const SubmissionTablePage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        return SubmissionTableView();
      },
    );
  }
}

class SubmissionTableView extends StatelessWidget {
  SubmissionTableView({super.key});

  static const routeName = '/submission-table';

  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          actions: [],
        ),
        body: SubmissionTable());
  }
}
