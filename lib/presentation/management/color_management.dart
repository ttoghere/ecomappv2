import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex(hexColor: "#ED9728");
  static Color darkGrey = HexColor.fromHex(hexColor: "#525252");
  static Color grey = HexColor.fromHex(hexColor: "#737477");
  static Color lightGrey = HexColor.fromHex(hexColor: "#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex(hexColor: "#B3ED9728");
  static Color darkPrimary = HexColor.fromHex(hexColor: "#D17D11");
  static Color grey1 = HexColor.fromHex(hexColor: "#707070");
  static Color grey2 = HexColor.fromHex(hexColor: "#797979");
  static Color white = HexColor.fromHex(hexColor: "#FFFFFFF");
  static Color error = HexColor.fromHex(hexColor: "#E61F34");
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
