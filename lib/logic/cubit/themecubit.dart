import 'package:ecommerce_app/core/theme/app_thems.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme) {
    loadTheme();
  }

  static final ThemeData _lightTheme = themeLigh();

  static final ThemeData _darkTheme = themeDark();
  void toggleTheme() async {
    final currentTheme = state;
    final newTheme = currentTheme == _lightTheme ? _darkTheme : _lightTheme;
    emit(newTheme);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', newTheme == _darkTheme);
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    emit(isDarkMode ? _darkTheme : _lightTheme);
  }
}
