import 'package:shared_preferences/shared_preferences.dart';
import 'package:customer_core/src/core/constants/app_identifiers.dart';

class AppThemeSharedPrefs {
  static String kUserPrefsKey = "${AppIdentifiers.kBuildIdentifier}/app_theme";

  static Future<bool> clearAppTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs
        .remove(kUserPrefsKey)
        .then((_) => true)
        .catchError((_) => false);
  }

  static Future<bool> getAppTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      bool? value = prefs.getBool(kUserPrefsKey);

      if (value == null) return false;

      return value;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> saveAppTheme(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setBool(kUserPrefsKey, value);

      return true;
    } catch (_) {
      return false;
    }
  }
}
