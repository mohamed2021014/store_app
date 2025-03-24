import 'package:ecommerce_app/core/Routes/app_routes.dart';
import 'package:ecommerce_app/core/app/class/connnectinity.dart';
import 'package:ecommerce_app/core/app/screen/no_network.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/logic/cubit/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/logic/cubit/fav_cubit.dart';
import 'package:ecommerce_app/logic/cubit/langcubit.dart' show LanguageCubit;
import 'package:ecommerce_app/logic/cubit/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/logic/cubit/navigatecubit.dart';
import 'package:ecommerce_app/logic/cubit/rejester/rejester_cubit.dart';
import 'package:ecommerce_app/logic/cubit/themecubit.dart';
import 'package:ecommerce_app/presentation/page/auth/login.dart';
import 'package:ecommerce_app/presentation/page/auth/onbording.dart';
import 'package:ecommerce_app/presentation/page/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Connnectinity.instance.isConnect,
      builder: (_, value, _) {
        if (value) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ThemeCubit()),
              BlocProvider(create: (context) => LanguageCubit()),
              BlocProvider(create: (context) => NavigationCubit()),
              BlocProvider(create: (context) => CartCubit()),
              BlocProvider(create: (context) => FavCubit()),
              BlocProvider(create: (context) => LoginCubit()),
              BlocProvider(create: (context) => RejesterCubit()),
            ],

            child: ScreenUtilInit(
              designSize: Size(375, 812),
              minTextAdapt: true,
              child: BlocBuilder<ThemeCubit, ThemeData>(
                buildWhen: (previous, current) {
                  return previous != current;
                },
                builder: (context, themeData) {
                  return BlocBuilder<LanguageCubit, Locale>(
                    builder: (context, local) {
                      return MaterialApp(
                        //lan===============================================================
                        debugShowCheckedModeBanner: false,
                        locale: Locale("$local"),
                        localizationsDelegates: [
                          S.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        supportedLocales: S.delegate.supportedLocales,
                        //  roouts=============================================================
                        onGenerateRoute: AppRoutes().onGneratRouts,

                        //  initialRoute: AppRoutes.login,
                        home:
                            FirebaseAuth.instance.currentUser != null &&
                                    FirebaseAuth
                                        .instance
                                        .currentUser!
                                        .emailVerified
                                ? Home()
                                : Onbording(), // homewidgwt(),
                        theme: themeData,

                        builder: (context, fghjk) {
                          return Scaffold(
                            body: Builder(
                              builder: (context) {
                                Connnectinity.instance.init();
                                return fghjk!;
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          );
        } else {
          return MaterialApp(home: NoNetwork());
        }
      },
    );
  }
}

Widget homewidgwt() {
  return StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      if (snapshot.hasData &&
          FirebaseAuth.instance.currentUser!.emailVerified) {
        return Home();
      } else {
        return Login();
      }
    },
  );
}
