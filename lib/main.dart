import 'package:ecommerce_app/core/app/class/sharepref.dart';
import 'package:ecommerce_app/core/app/di/injectioncontaner.dart';
import 'package:ecommerce_app/ecommerc_App.dart';
import 'package:ecommerce_app/firebase_options.dart'
    show DefaultFirebaseOptions;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref().instantiatePreferences();
  await setUpingegtion();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const EcommerceApp());
  });
}
