import 'package:ecommerce_app/core/Routes/app_routes.dart';
import 'package:ecommerce_app/core/constant/app_lotti.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/logic/cubit/rejester/rejester_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class EmailVerifi extends StatelessWidget {
  const EmailVerifi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<RejesterCubit, RejesterState>(
        builder: (context, state) {
          if (state is EmailVerifii) {
            return SafeArea(
              child: Column(
                children: [
                  Icon(
                    Icons.done_outline_sharp,
                    color: const Color.fromARGB(255, 97, 4, 113),
                    size: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      S.of(context).Verified_successfully,
                      style: GoogleFonts.aBeeZee(
                        textStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.home,
                        (route) => false,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 47, 1, 108),
                            const Color.fromARGB(255, 124, 68, 255),
                          ],
                        ),
                      ),

                      child: Text(
                        S.of(context).continuation,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is Rejestersucess) {
            return SafeArea(
              child: Column(
                children: [
                  Lottie.asset(AppLotti.senmail, height: 199),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      S.of(context).email_verifi,
                      style: GoogleFonts.aBeeZee(
                        textStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      context.read<RejesterCubit>().checemailverifi();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 47, 1, 108),
                            const Color.fromARGB(255, 124, 68, 255),
                          ],
                        ),
                      ),

                      child: Text(
                        S.of(context).relode,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container(
            child: SafeArea(
              child: Column(
                children: [
                  Icon(
                    Icons.done_outline_sharp,
                    color: const Color.fromARGB(255, 97, 4, 113),
                    size: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      S.of(context).Verified_successfully,
                      style: GoogleFonts.aBeeZee(
                        textStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.home,
                        (route) => false,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 47, 1, 108),
                            const Color.fromARGB(255, 124, 68, 255),
                          ],
                        ),
                      ),

                      child: Text(
                        S.of(context).continuation,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
