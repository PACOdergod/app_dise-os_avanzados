import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {

  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;

  ThemeData get currentTheme => _currentTheme;

  set darkTheme( bool value ){
    _customTheme = false;
    _darkTheme = value;

    if ( value ) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme( bool value ){
    _darkTheme = false;
    _customTheme = value;

    if ( value ) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}