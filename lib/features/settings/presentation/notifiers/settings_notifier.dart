import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/core_providers.dart';

class SettingsState {
  final ThemeMode themeMode;
  final bool allowAdultContent;
  final bool autoPlayTrailers;

  const SettingsState({
    this.themeMode = ThemeMode.system,
    this.allowAdultContent = false,
    this.autoPlayTrailers = true,
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    bool? allowAdultContent,
    bool? autoPlayTrailers,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      allowAdultContent: allowAdultContent ?? this.allowAdultContent,
      autoPlayTrailers: autoPlayTrailers ?? this.autoPlayTrailers,
    );
  }
}

class SettingsNotifier extends StateNotifier<SettingsState> {
  final Ref _ref;

  SettingsNotifier(this._ref) : super(const SettingsState()) {
    _loadSettings();
  }

  void _loadSettings() {
    final prefsService = _ref.read(preferencesServiceProvider);
    state = SettingsState(
      themeMode: prefsService.themeMode,
      allowAdultContent: prefsService.allowAdultContent,
      autoPlayTrailers: prefsService.autoPlayTrailers,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final prefsService = _ref.read(preferencesServiceProvider);
    await prefsService.setThemeMode(mode);
    state = state.copyWith(themeMode: mode);
  }

  Future<void> toggleAdultContent(bool value) async {
    final prefsService = _ref.read(preferencesServiceProvider);
    await prefsService.setAllowAdultContent(value);
    state = state.copyWith(allowAdultContent: value);
  }

  Future<void> toggleAutoPlayTrailers(bool value) async {
    final prefsService = _ref.read(preferencesServiceProvider);
    await prefsService.setAutoPlayTrailers(value);
    state = state.copyWith(autoPlayTrailers: value);
  }
}

final settingsNotifierProvider = StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier(ref);
});
