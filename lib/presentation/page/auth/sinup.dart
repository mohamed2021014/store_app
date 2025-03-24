import 'package:ecommerce_app/core/Routes/app_routes.dart';
import 'package:ecommerce_app/core/animation/animation_do.dart';
import 'package:ecommerce_app/core/constant/app_lotti.dart';
import 'package:ecommerce_app/generated/l10n.dart';

import 'package:ecommerce_app/logic/cubit/rejester/rejester_cubit.dart';
import 'package:ecommerce_app/presentation/page/auth/email_verifi.dart';

import 'package:ecommerce_app/presentation/widget/auth/costom_buttom.dart';
import 'package:ecommerce_app/presentation/widget/auth/costum_textform.dart';
import 'package:ecommerce_app/presentation/widget/custom_snacpar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class SinUp extends StatelessWidget {
  SinUp({super.key});
  GlobalKey<FormState> formk = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
                  CustomFadeInDown(
                    duration: 400,
                    child: Center(
                      child: SizedBox(
                        height: 200,
                        child: Lottie.asset(AppLotti.sinUp),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  SizedBox(height: 5),
                  CustomFadeInRight(
                    duration: 500,
                    child: Text(
                      S.of(context).sign_up_welcome,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  SizedBox(height: 20),
                  Sinup(formk: formk),

                  //  Spacer(),
                  // SizedBox(height: MediaQuery.of(context).size.height),
                  SizedBox(height: 160),
                  CustomFadeInUp(
                    duration: 500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).you_have_account,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(width: 2),

                        InkWell(
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(AppRoutes.login);
                          },
                          child: Text(
                            S.of(context).login,
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

class Sinup extends StatefulWidget {
  final GlobalKey<FormState> formk;

  Sinup({super.key, required this.formk});

  @override
  State<Sinup> createState() => _SinupState();
}

class _SinupState extends State<Sinup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isbool = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RejesterCubit, RejesterState>(
      listener: (context, state) {
        if (state is Rejestersucess) {
          //    showSnackbarMessage(context, "sucsess", Colors.red);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => EmailVerifi()),
          );
        } else if (state is RejesterIError) {
          showSnackbarMessage(context, state.messige, Colors.red);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomFadeInRight(
              duration: 500,
              child: CostemTextFiled(
                controller: email, //context.read<AuthCubit>().emaillog,
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
                controller: password, //context.read<AuthCubit>().passwordlod,
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

            CustomFadeInRight(
              duration: 500,
              child: CustomButtomAuth(
                onTap: () async {
                  if (widget.formk.currentState!.validate()) {
                    //   context.read<AuthCubit>().creatAcouunt(context);
                    context.read<RejesterCubit>().rejesterUSer(
                      email: email.text,
                      password: password.text,
                    );
                  }
                },
                text:
                    state is RejesterLOding
                        ? CircularProgressIndicator()
                        : Text(
                          S.of(context).Getstart,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                widgett:
                    state is RejesterLOding
                        ? Container()
                        : Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.white,
                        ),
                //
              ),
            ),
          ],
        );
      },
    );
  }
}
