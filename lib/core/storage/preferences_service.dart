import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences _prefs;

  static const String keyThemeMode = 'theme_mode';
  static const String keyAdultContent = 'adult_content';
  static const String keyAutoPlayTrailers = 'autoplay_trailers';

  PreferencesService(this._prefs);

  ThemeMode get themeMode {
    final val = _prefs.getString(keyThemeMode);
    switch (val) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<bool> setThemeMode(ThemeMode mode) async {
    return await _prefs.setString(keyThemeMode, mode.name);
  }

  bool get allowAdultContent => _prefs.getBool(keyAdultContent) ?? false;

  Future<bool> setAllowAdultContent(bool value) async {
    return await _prefs.setBool(keyAdultContent, value);
  }

  bool get autoPlayTrailers => _prefs.getBool(keyAutoPlayTrailers) ?? true;

  Future<bool> setAutoPlayTrailers(bool value) async {
    return await _prefs.setBool(keyAutoPlayTrailers, value);
  }
}
