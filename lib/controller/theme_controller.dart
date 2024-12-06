import 'package:diparture/helper/shr_pref.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  late bool _isDark;
  late ThemePreference _prefs;

  bool get isDark => _isDark;

  ThemeController() {
    _isDark = false;
    _prefs = ThemePreference();
    getPrefs();
  }

  set isDark(bool value) {
    _isDark = value;
    _prefs.setTheme(value);
    notifyListeners();
  }

  getPrefs() async {
    _isDark = await _prefs.getTheme();
    notifyListeners();
  }

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
