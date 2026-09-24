import 'package:flutter/material.dart';
import 'theme_controller.dart';

/// Central visual system for the application.
/// Keep screen-specific colors out of Owner screens.
class AppColors {
  final Color bg;
  final Color surface;
  final Color panel;
  final Color panelElevated;
  final Color panelBorder;
  final Color gold;
  final Color goldSoft;
  final Color accent;
  final Color accentSoft;
  final Color muted;
  final Color red;
  final Color green;
  final Color blue;
  final Color textPrimary;
  final Color textSecondary;
  final Color onGold;

  const AppColors({
    required this.bg,
    required this.surface,
    required this.panel,
    required this.panelElevated,
    required this.panelBorder,
    required this.gold,
    required this.goldSoft,
    required this.accent,
    required this.accentSoft,
    required this.muted,
    required this.red,
    required this.green,
    required this.blue,
    required this.textPrimary,
    required this.textSecondary,
    required this.onGold,
  });

  /// Premium dark palette: midnight navy + champagne + cyan.
  static const dark = AppColors(
    bg: Color(0xFF070B14),
    surface: Color(0xFF0B1220),
    panel: Color(0xFF101A2B),
    panelElevated: Color(0xFF17243A),
    panelBorder: Color(0xFF263653),
    gold: Color(0xFFE0B765),
    goldSoft: Color(0xFFF3D79D),
    accent: Color(0xFF4FD8C7),
    accentSoft: Color(0xFF9BF0E6),
    muted: Color(0xFF8D9AB0),
    red: Color(0xFFFF6D68),
    green: Color(0xFF54D6A6),
    blue: Color(0xFF73A9FF),
    textPrimary: Color(0xFFF7F9FC),
    textSecondary: Color(0xFFC2CBD9),
    onGold: Color(0xFF15120B),
  );

  /// Premium light palette: pearl + warm gold + deep teal.
  static const light = AppColors(
    bg: Color(0xFFF4F7FB),
    surface: Color(0xFFEAF0F7),
    panel: Color(0xFFFFFFFF),
    panelElevated: Color(0xFFFFFFFF),
    panelBorder: Color(0xFFD8E1EC),
    gold: Color(0xFFB47A25),
    goldSoft: Color(0xFF8D5D18),
    accent: Color(0xFF087F75),
    accentSoft: Color(0xFF126B64),
    muted: Color(0xFF667085),
    red: Color(0xFFD64F48),
    green: Color(0xFF238C69),
    blue: Color(0xFF386DB5),
    textPrimary: Color(0xFF151B26),
    textSecondary: Color(0xFF465267),
    onGold: Colors.white,
  );

  Color get cardShadow => Colors.black.withOpacity(.10);
  Color get softGold => gold.withOpacity(.11);
  Color get softAccent => accent.withOpacity(.10);

  LinearGradient get primaryGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [gold, gold.withOpacity(.72)],
      );

  LinearGradient get accentGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [accent, accent.withOpacity(.68)],
      );
}

extension AppColorsX on BuildContext {
  AppColors get colors =>
      ThemeScope.of(this).isDark ? AppColors.dark : AppColors.light;
}
