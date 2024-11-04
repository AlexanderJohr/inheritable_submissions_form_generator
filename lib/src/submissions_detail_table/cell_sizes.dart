import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class CellSizesService {
  BehaviorSubject repaintTable = BehaviorSubject.seeded(false);
  final Map<int, double> cellHeights = {};
  final Map<int, double> cellWidths = {};

}

