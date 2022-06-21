import 'package:flutter/material.dart';

class ColorManager {
  static String primary = "#ED9728";
  static String darkGrey = "#525252";
  static String grey = "#737477";
  static String lightGrey = "#9E9E9E";
  static String primaryOpacity70 = "#B3ED9728";
}

extension HexColor on Color {
  static Color fromHex({required String hexColor}) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor == "FF$hexColor"; // Opaklık için %100 değer sağlar
    }
    return Color(
      int.parse(hexColor, radix: 16),
    );
  }
}
