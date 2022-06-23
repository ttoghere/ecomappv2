//Extension On String
import 'package:ecomappv2/data/mapper/mapper.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Empty;
    } else {
      return this!;
    }
  }
}

//Extension On Int
extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Zero;
    } else {
      return this!;
    }
  }
}
