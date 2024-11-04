import 'package:flutter/services.dart';

final germanDecimalInputFormatter = <TextInputFormatter>[
  FilteringTextInputFormatter.deny('.', replacementString: ','),
  FilteringTextInputFormatter.allow(RegExp(r'(^\d*\,?\d{0,2})')),
];
