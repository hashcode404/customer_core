import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:customer_core/src/application/core/base_controller.dart';
import 'package:customer_core/src/infrastructure/theme/theme_shared_prefs_repo.dart';

@LazySingleton()
class ThemeProvider extends ChangeNotifier with BaseController {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeMode get currentTheme => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  @override
  Future<void> init() {
    loadAppTheme();
    return super.init();
  }

  Future<bool> loadAppTheme() async {
    final val = await AppThemeSharedPrefs.getAppTheme();
    _isDarkMode = val;
    notifyListeners();
    return val;
  }
}
