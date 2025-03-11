import 'package:ecommerce_app/core/constant/images_.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/logic/cubit/langcubit.dart';
import 'package:ecommerce_app/logic/cubit/themecubit.dart';
import 'package:ecommerce_app/presentation/widget/costomnavigationbar/custom_Listileswith.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.watch<LanguageCubit>();
    return Scaffold(
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
                child: CircleAvatar(
                  backgroundImage: AssetImage(AppImges.nouser),
                  backgroundColor: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "User",
                style: GoogleFonts.aclonica(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "mohamed@hemil.com",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
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
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
