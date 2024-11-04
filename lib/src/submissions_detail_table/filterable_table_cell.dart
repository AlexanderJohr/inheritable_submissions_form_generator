import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import 'choice_filter_service.dart';
import 'cell_sizes.dart';

class FilterableTableCell extends StatelessWidget {
  final String title;
  final ChoiceQuestion id;
  final TableVicinity tableVicinity;
  final Map<String, String> titleByValues;

  GlobalKey _textKey = GlobalKey();
  GlobalKey _marginKey = GlobalKey();
  GlobalKey _IconKey = GlobalKey();

  ChoiceFilterService get filterService => GetIt.I.get<ChoiceFilterService>();

  FilterableTableCell({
    super.key,
    required this.title,
    required this.id,
    required this.titleByValues,
    required this.tableVicinity,
  }) : selectedValues = {
          for (var item in titleByValues.keys) item: true,
          '""': true
        };

  final Map<String, bool> selectedValues;
  final BehaviorSubject valuesChanged = BehaviorSubject();

  void _selectAll() {
    selectedValues.updateAll((key, value) => true);
    filterService.filter[id] = selectedValues;
    valuesChanged.add(true);
    filterService.changed.add(true);
  }

  void _deselectAll() {
    selectedValues.updateAll((key, value) => false);
    filterService.filter[id] = selectedValues;
    valuesChanged.add(true);
    filterService.changed.add(true);
  }

  @override
  Widget build(BuildContext context) {
    final widgetsBinding = WidgetsBinding.instance;

    widgetsBinding.addPostFrameCallback((a) {
      if (context.mounted) {
        final size = context.size;

        if (size != null) {
          final textRenderBox =
              _textKey.currentContext?.findRenderObject() as RenderBox?;

          final marginRenderBox =
              _marginKey.currentContext?.findRenderObject() as RenderBox?;

          final iconRenderBox =
              _IconKey.currentContext?.findRenderObject() as RenderBox?;

          final textWidth = (textRenderBox?.size.width ?? 0.0);
          final textHeight = (textRenderBox?.size.height ?? 0.0);

          final marginWidth = (marginRenderBox?.size.width ?? 0.0);
          final marginHeight = (marginRenderBox?.size.height ?? 0.0);

          final iconWidth = (iconRenderBox?.size.width ?? 0.0);
          final iconHeight = (iconRenderBox?.size.height ?? 0.0);

          final widthSum = textWidth + marginWidth + iconWidth;
          final heightSum = textHeight + marginHeight + iconHeight;

          final widthBefore = GetIt.I
                  .get<CellSizesService>()
                  .cellWidths[tableVicinity.column] ??
              0;
          final heightBefore =
              GetIt.I.get<CellSizesService>().cellHeights[tableVicinity.row] ??
                  0;

          if (widthBefore < widthSum) {
            GetIt.I.get<CellSizesService>().cellWidths[tableVicinity.column] =
                widthSum + 16;
          }
          if (heightBefore < heightSum) {
            GetIt.I.get<CellSizesService>().cellHeights[tableVicinity.row] =
                heightSum + 4;
          }

          if (widthBefore < widthSum || heightBefore < heightSum) {
            GetIt.I.get<CellSizesService>().repaintTable.add(true);
          }
        }
      }
    });

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            key: _textKey,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 0, key: _marginKey),
          PopupMenuButton(
            key: _IconKey,
            icon: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.filter_list),
                ),
                if (filterService.showFilterCountLabel(id))
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Center(
                        child: Text(
                          filterService.filterLabel(id),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: StreamBuilder(
                  stream: filterService.changed,
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        TextButton(
                          onPressed: _selectAll,
                          child:
                              Text(AppLocalizations.of(context)!.selectAllText),
                        ),
                        TextButton(
                          onPressed: _deselectAll,
                          child: Text(
                              AppLocalizations.of(context)!.deselectAllText),
                        ),
                        ToggleButtons(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: filterService.getFilterMode(id) ==
                                          FilterMode.containsAnyOf,
                                      onChanged: (value) {}),
                                  Expanded(
                                      child: Text(AppLocalizations.of(context)!
                                          .containsAnyOfText)),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: filterService.getFilterMode(id) ==
                                          FilterMode.containsExactly,
                                      onChanged: (value) {}),
                                  Expanded(
                                      child: Text(AppLocalizations.of(context)!
                                          .containsExactlyText)),
                                ],
                              ),
                            ),
                          ],
                          isSelected: [
                            filterService.getFilterMode(id) ==
                                FilterMode.containsAnyOf,
                            filterService.getFilterMode(id) ==
                                FilterMode.containsExactly,
                          ],
                          onPressed: (int index) {
                            filterService.setFilterMode(
                                id,
                                switch (index) {
                                  0 => FilterMode.containsAnyOf,
                                  1 => FilterMode.containsExactly,
                                  _ => filterService.getFilterMode(id)
                                });
                          },
                          direction:
                              Axis.vertical, // Setze die Richtung auf vertikal
                        ),
                        ...titleByValues.keys.map((value) {
                          return CheckboxListTile(
                            title: Text(titleByValues[value] ?? ""),
                            value: filterService.filter[id]?[value] ?? true,
                            onChanged: (bool? selected) {
                              selectedValues[value] = selected ?? false;

                              filterService.setFilter(
                                  question: id,
                                  answer: value,
                                  selected: selected ?? false);

                              valuesChanged.add(true);
                            },
                          );
                        }).toList(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
