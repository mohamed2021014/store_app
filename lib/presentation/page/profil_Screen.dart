import 'dart:io';

import 'package:ecommerce_app/core/Routes/app_routes.dart';
import 'package:ecommerce_app/core/app/class/sharepref.dart';
import 'package:ecommerce_app/core/constant/images_.dart';
import 'package:ecommerce_app/core/constant/strings.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/logic/cubit/img_paker_cubit.dart';
import 'package:ecommerce_app/logic/cubit/langcubit.dart';
import 'package:ecommerce_app/logic/cubit/themecubit.dart';
import 'package:ecommerce_app/model/cart_item.dart';
import 'package:ecommerce_app/model/fav_model.dart';
import 'package:ecommerce_app/presentation/widget/costomnavigationbar/custom_Listileswith.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.watch<LanguageCubit>();
    return BlocProvider(
      create: (context) => ImageCubit(),
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 100),
                SizedBox(
                  height: 100,
                  width: 100,
                  // child: CircleAvatar(
                  //   backgroundImage: AssetImage(AppImges.nouser),
                  //   backgroundColor: Colors.black,

                  // ),
                  child: BlocBuilder<ImageCubit, File?>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          context.read<ImageCubit>().pickImage();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image:
                                state != null
                                    ? DecorationImage(image: FileImage(state))
                                    : DecorationImage(
                                      image: AssetImage(AppImges.nouser),
                                    ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  " ${FirebaseAuth.instance.currentUser!.email}",
                  style: GoogleFonts.aclonica(
                    textStyle: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 5),

                Divider(),

                Listileswiith(
                  onChanged: (p0) {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  value:
                      context.watch<ThemeCubit>().state.brightness ==
                      Brightness.dark,
                  textt: S.of(context).dark_mode,
                  leading: Icon(Icons.dark_mode),
                ),
                Divider(indent: 100, endIndent: 100),

                Row(
                  children: [
                    SizedBox(width: 18),
                    Icon(Icons.language_rounded),
                    SizedBox(width: 15),
                    Text(
                      S.of(context).language_tilte,
                      style: GoogleFonts.abhayaLibre(
                        textStyle: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Spacer(),
                    DropdownButton<String>(
                      style: Theme.of(context).textTheme.headlineSmall,
                      value: languageCubit.state.languageCode,

                      items: [
                        DropdownMenuItem(value: 'en', child: Text('English')),
                        DropdownMenuItem(value: 'ar', child: Text('العربية')),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          languageCubit.changeLanguage(value);
                        }
                      },
                    ),
                  ],
                ),
                Divider(indent: 100, endIndent: 100),
                Listileswiith(
                  onChanged: (bool value) {},
                  value: false,

                  textt: S.of(context).nativication,
                  leading: Icon(Icons.notifications_active),
                ),
                Divider(indent: 100, endIndent: 100),
                InkWell(
                  onTap: () {
                    //   context.read<AuthCubit>().exit();
                    Box<CartItem> cart = Hive.box<CartItem>(Strings.cartbox);
                    if (cart.isNotEmpty) {
                      cart.clear();
                    }

                    Box<FavModel> fav = Hive.box<FavModel>(Strings.favBoc);
                    if (fav.isNotEmpty) {
                      fav.clear();
                    }

                    FirebaseAuth.instance.signOut();
                    SharedPref().clearPreferences();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.login,
                      (route) => false,
                    );
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 18),
                      Icon(Icons.logout),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).log_out,
                        style: GoogleFonts.abhayaLibre(
                          textStyle: TextStyle(color: Colors.red, fontSize: 17),
                        ),
                      ),
                      Spacer(),
                      Text(
                        S.of(context).log_out,
                        style: GoogleFonts.abhayaLibre(
                          textStyle: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_sharp, size: 10),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
