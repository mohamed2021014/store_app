import 'package:ecommerce_app/core/app/class/sharepref.dart';
import 'package:ecommerce_app/core/app/di/injectioncontaner.dart';
import 'package:ecommerce_app/core/constant/strings.dart';
import 'package:ecommerce_app/ecommerc_App.dart';
import 'package:ecommerce_app/firebase_options.dart'
    show DefaultFirebaseOptions;
import 'package:ecommerce_app/model/cart_item.dart';
import 'package:ecommerce_app/model/fav_model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartItemAdapter());
  Hive.openBox<CartItem>(Strings.cartbox);
  Hive.registerAdapter(FavModelAdapter());
  Hive.openBox<FavModel>(Strings.favBoc);
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
