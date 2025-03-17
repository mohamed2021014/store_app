import 'package:ecommerce_app/core/Routes/base_routs.dart';
import 'package:ecommerce_app/core/app/screen/no_route.dart';
import 'package:ecommerce_app/model/get_all_prudict.dart';
import 'package:ecommerce_app/presentation/page/auth/login.dart';
import 'package:ecommerce_app/presentation/page/auth/sinup.dart';
import 'package:ecommerce_app/presentation/page/prudcit_detils.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static const String login = 'login';
  static const String sinup = "sinup";
  static const String prudicDetils = "prudicDetils";

  Route onGneratRouts(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return BaseRoute(page: Login());
      case sinup:
        return BaseRoute(page: SinUp());
      case prudicDetils:
        final PrudctModel arg = settings.arguments as PrudctModel;
        return BaseRoute(page: PrudcitDetils(data: arg));

      default:
        return BaseRoute(page: NoRoute());
    }
  }
}
