import 'package:flutter/material.dart';

/// Small app-wide controller for the Owner light/dark appearance.
class ThemeController extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.dark;

  ThemeMode get mode => _mode;
  bool get isDark => _mode == ThemeMode.dark;

  void toggleTheme() {
    setDark(!isDark);
  }

  void setDark(bool dark) {
    final next = dark ? ThemeMode.dark : ThemeMode.light;
    if (_mode == next) return;
    _mode = next;
    notifyListeners();
  }
}

class ThemeScope extends InheritedNotifier<ThemeController> {
  const ThemeScope({
    super.key,
    required ThemeController controller,
    required super.child,
  }) : super(notifier: controller);

  static ThemeController of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<ThemeScope>();
    assert(scope != null, 'ThemeScope.of() called with no ThemeScope ancestor');
    return scope!.notifier!;
  }
}
