import 'package:flutter/material.dart';

import 'theme_tokens.dart';

abstract final class AppTheme {
  static final light = _create(Brightness.light, ThemeTokens.lightAccent);
  static final dark = _create(Brightness.dark, ThemeTokens.darkAccent);

  static ThemeData _create(Brightness brightness, Color seedColor) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeTokens.radiusMedium),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
    );
  }
}
