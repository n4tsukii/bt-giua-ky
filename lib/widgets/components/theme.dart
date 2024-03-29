import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkModeEnabled = false;

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  Color get appBarColor {
    return _isDarkModeEnabled ? Colors.black45 : Colors.blueAccent;
  }

  void toggleDarkMode() {
    _isDarkModeEnabled = !_isDarkModeEnabled;
    notifyListeners();
  }
}
// class ThemeNotifier with ChangeNotifier {
//   ThemeData _themeData = lightTheme;
//
//   // ThemeNotifier(this._themeData);
//
//   ThemeData getTheme() => _themeData;
//
//   void setTheme(ThemeData themeData) async {
//     _themeData = themeData;
//     notifyListeners();
//   }
// }
//
// void onThemeChanged(bool isDarkMode, ThemeNotifier themeNotifier) {
//   themeNotifier.setTheme(isDarkMode ? darkTheme : lightTheme);
// }
// final darkTheme = ThemeData(
//   primarySwatch: Colors.orange,
//   fontFamily: 'Product Sans',
//   primaryColor: const Color(0xFF1F1F1F),
//   scaffoldBackgroundColor: const Color(0xFF1F1F1F),
//   brightness: Brightness.dark,
//   backgroundColor: const Color(0xFF262626),
//   floatingActionButtonTheme:
//   const FloatingActionButtonThemeData(foregroundColor: Colors.white),
//   dividerColor: Colors.black12,
// );

// final lightTheme = ThemeData(
//   primarySwatch: Colors.orange,
//   primaryColor: const Color(0xFFfbab66),
//   fontFamily: 'Product Sans',
//   brightness: Brightness.light,
//   backgroundColor: Colors.white,
//   floatingActionButtonTheme:
//   const FloatingActionButtonThemeData(foregroundColor: Colors.white),
//   dividerColor: Colors.white54,
// );
