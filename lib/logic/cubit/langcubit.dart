import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(Locale('en')) {
    loadLanguage();
  }

  void changeLanguage(String languageCode) async {
    final newLocale = Locale(languageCode);
    emit(newLocale);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', languageCode);
  }

  void loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('languageCode') ?? 'en';
    emit(Locale(languageCode));
  }
}
