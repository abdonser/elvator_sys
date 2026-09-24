import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'owner/main_screen.dart';
import 'theme_controller.dart';
import 'app_color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppRoot());
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  final ThemeController _themeController = ThemeController();

  @override
  void dispose() {
    _themeController.dispose();
    super.dispose();
  }

  ThemeData _buildTheme(AppColors c, Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: c.gold,
      brightness: brightness,
      surface: c.panel,
      primary: c.gold,
      secondary: c.accent,
      error: c.red,
    );

    final base = ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.bg,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      splashFactory: InkSparkle.splashFactory,
    );

    final textTheme = GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: c.textPrimary,
      displayColor: c.textPrimary,
    );

    return base.copyWith(
      textTheme: textTheme,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeForwardsPageTransitionsBuilder(),
        },
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.panel,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        hintStyle: textTheme.bodyMedium?.copyWith(color: c.muted),
        prefixIconColor: c.muted,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: c.panelBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: c.panelBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: c.gold, width: 1.4),
        ),
      ),
      cardTheme: CardThemeData(
        color: c.panel,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: c.panelBorder),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: c.panelBorder,
        thickness: 1,
        space: 1,
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 72,
        backgroundColor: c.panel,
        surfaceTintColor: Colors.transparent,
        indicatorColor: c.gold.withOpacity(.15),
        labelTextStyle: WidgetStatePropertyAll(
          GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: c.panel,
        selectedIconTheme: IconThemeData(color: c.gold),
        unselectedIconTheme: IconThemeData(color: c.muted),
        selectedLabelTextStyle: GoogleFonts.inter(
          color: c.goldSoft,
          fontWeight: FontWeight.w700,
          fontSize: 11,
        ),
        unselectedLabelTextStyle: GoogleFonts.inter(
          color: c.muted,
          fontWeight: FontWeight.w500,
          fontSize: 11,
        ),
        indicatorColor: c.gold.withOpacity(.14),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: c.gold,
        foregroundColor: c.onGold,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? c.gold
              : c.muted,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? c.gold.withOpacity(.28)
              : c.panelBorder,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeController,
      builder: (context, _) {
        return ThemeScope(
          controller: _themeController,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: _themeController.mode,
            themeAnimationDuration: const Duration(milliseconds: 350),
            themeAnimationCurve: Curves.easeOutCubic,
            theme: _buildTheme(AppColors.light, Brightness.light),
            darkTheme: _buildTheme(AppColors.dark, Brightness.dark),
            home: const MainScreen(),
          ),
        );
      },
    );
  }
}
