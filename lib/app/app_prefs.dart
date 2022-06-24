import 'package:ecomappv2/presentation/management/management_shelf.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String Prefs_Key_Lang = "Prefs_Key_Lang";

class AppPreferences {
  SharedPreferences sharedPreferences;
  AppPreferences({
    required this.sharedPreferences,
  });

  Future<String> getAppLanguage() async {
    String? language = sharedPreferences.getString(Prefs_Key_Lang);
    if (language != null && language.isEmpty) {
      return language;
    } else {
      return LanguageType.English.getValue();
    }
  }
}
