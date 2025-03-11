import 'package:ecommerce_app/core/Routes/app_routes.dart';
import 'package:ecommerce_app/core/animation/animation_do.dart';
import 'package:ecommerce_app/core/constant/app_lotti.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/logic/cubit/langcubit.dart';
import 'package:ecommerce_app/logic/cubit/themecubit.dart';
import 'package:ecommerce_app/presentation/widget/auth/costom_buttom.dart';
import 'package:ecommerce_app/presentation/widget/auth/costum_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});
  GlobalKey<FormState> formk = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.watch<LanguageCubit>();
    //  final cubit = context.read<AppCubitCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formk,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Switch(
                        value:
                            context.watch<ThemeCubit>().state.brightness ==
                            Brightness.dark,
                        onChanged: (value) {
                          context.read<ThemeCubit>().toggleTheme();
                        },
                      ),
                      Spacer(),
                      DropdownButton<String>(
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

                  CustomFadeInDown(
                    duration: 400,
                    child: Center(
                      child: SizedBox(
                        height: 200,
                        child: Lottie.asset(AppLotti.login),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  CustomFadeInLeft(
                    duration: 500,
                    child: Text(
                      S.of(context).welcom,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 5),
                  CustomFadeInRight(
                    duration: 500,
                    child: Text(
                      S.of(context).login,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  SizedBox(height: 20),
                  CostomLogin(formk: formk),

                  InkWell(
                    onTap: () {
                      // SharedPref().clearPreferences();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  S.of(context).Loginwith,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Icon(
                                  Icons.g_mobiledata_sharp,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //  Spacer(),
                  // SizedBox(height: MediaQuery.of(context).size.height),
                  SizedBox(height: 60),
                  CustomFadeInUp(
                    duration: 500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).donthaveanaccount,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),

                        InkWell(
                          onTap:
                              () => Navigator.of(
                                context,
                              ).pushReplacementNamed(AppRoutes.sinup),
                          child: Text(
                            S.of(context).Creataccountp,
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CostomLogin extends StatefulWidget {
  final GlobalKey<FormState> formk;
  const CostomLogin({super.key, required this.formk});

  @override
  State<CostomLogin> createState() => _CostomLoginState();
}

class _CostomLoginState extends State<CostomLogin> {
  bool isbool = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFadeInRight(
          duration: 500,
          child: CostemTextFiled(
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            validator: (valuo) {
              if (valuo == null ||
                  valuo.isEmpty ||
                  !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(valuo)) {
                return S.of(context).valid_email;
              }
              return null;
            },
            hint: S.of(context).email,
            label: S.of(context).email,
            icon: Icon(Icons.email_outlined),
          ),
        ),
        SizedBox(height: 10),
        CustomFadeInLeft(
          duration: 500,
          child: CostemTextFiled(
            obscureText: isbool,
            validator: (valuo) {
              if (valuo == null || valuo.isEmpty || valuo.length < 8) {
                return S.of(context).valid_passwrod;
              }
              return null;
            },
            hint: S.of(context).password,
            label: S.of(context).password,
            icon: InkWell(
              onTap: () {
                setState(() {
                  isbool = !isbool;
                });
              },
              child: Icon(Icons.visibility_off_outlined),
            ),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            S.of(context).forgetpassword,
            style: TextStyle(color: Colors.blue),
          ),
        ),

        CustomFadeInRight(
          duration: 500,
          child: CustomButtomAuth(
            onTap: () {
              widget.formk.currentState!.validate();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('validat')));
            },
            text: S.of(context).Getstart,
          ),
        ),
      ],
    );
  }
}

//   Column Coustomlogin(BuildContext context) {
//     return
//   }
// }
